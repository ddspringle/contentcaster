<!---

ContentCaster
by Denard Springle (sales@dvdmenubacks.com)
Copyright 2008 Virtual Solutions Group. Some rights reserved.

This software is licensed under a Creative Commons Attribution-Non Commercial 3.0 license. You may
use, modify, copy and redistribute this software in accordance with the creative commons license 
agreement so long as you attribute it to Denard Springle or Virtual Solutions Group. This notice 
must remain intact and you may not use or repurpose this software for any commercial use without 
the express written consent of Virtual Solutions Group.

This software is open source, and as such is presented as-is with no warranty, expressed or implied,
as to the merchantability or fitness for any particular purpose. Use of this software is at your own
risk and you agree to hold harmless Virtual Solutions Group from any damages, direct or consequential,
out of your use, or misuse, of this software.

--->
<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="/components/adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cfset level = "user">
  <cfelse>
  <cfset level = "admin">
</cfif>
<cfif auth[1] EQ "invalid" OR auth[1] EQ "timeout">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- set params --->
<cfparam name="URL.d" default="#DateFormat(Now(),'yyyy-mm-dd')#">
<cfparam name="URL.z" default="">
<!--- check for existence of 'z' --->
<cfif URL.d EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase
</cfquery>
<!--- set start and end time for today --->
<cfset startTime = CreateDateTime(Year(URL.d), Month(URL.d), Day(URL.d), 0, 0, 0)>
<cfset endTime = CreateDateTime(Year(URL.d), Month(URL.d), Day(URL.d), 23, 59, 59)>
<!--- get today's content --->
<cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_defaultcategoryschedule WHERE (runDate BETWEEN #startTime# AND #endTime#)
</cfquery>
<!--- get content for this category --->
<cfquery name="qGetCategory" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
SELECT * FROM a_categorybase
</cfquery>
<!--- join category to schedule --->
<cfquery name="qGetNewSched" dbtype="query" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM qGetSched, qGetCategory WHERE qGetSched.ucid = qGetCategory.ucid
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Plan Default Content &raquo; #DateFormat(URL.d,'mmmm dd, yyyy')#">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<form action="updateDefaultContentDate.cfm" method="post" name="updateDefaultContentDate" id="updateDefaultContentDate">
  <cfoutput>
    <input type="hidden" name="date" value="#URL.d#" />
  </cfoutput>
  <table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
    <tr>
      <td class="bodyLeft">&nbsp;</td>
      <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
          <tr>
            <td colspan="3" class="dailyContentBoxTitle">&nbsp;</td>
          </tr>
          <tr>
            <td class="newUserLeft">&nbsp;</td>
            <td class="textTable"><table border="0" cellspacing="2" cellpadding="2" class="textTable">
                <tr>
                  <td class="planningTableText" colspan="2"><cfoutput>Default Content&nbsp;&raquo;&nbsp;#DateFormat(URL.d,'mmmm dd, yyyy')#</cfoutput></td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <cfset cX = 0>
                <cfloop from="0" to="11" index="iX">
                  <cfset cX = cX + 1>
                  <cfif cX GT 12>
                    <cfset cX = 1>
                  </cfif>
                  <!--- set start and end time for left loop --->
                  <cfset startLoopLeft = CreateDateTime(Year(URL.d), Month(URL.d), Day(URL.d), iX, 0, 0)>
                  <cfset endLoopLeft = CreateDateTime(Year(URL.d), Month(URL.d), Day(URL.d), iX, 59, 59)>
                  <!--- set start and end time for right loop --->
                  <cfset startLoopRight = CreateDateTime(Year(URL.d), Month(URL.d), Day(URL.d), iX+12, 0, 0)>
                  <cfset endLoopRight = CreateDateTime(Year(URL.d), Month(URL.d), Day(URL.d), iX+12, 59, 59)>
                  <!--- get left column hour content --->
                  <cfquery name="qGetHourLeft" dbtype="query" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				SELECT * FROM qGetNewSched WHERE (runDate BETWEEN #startLoopLeft# AND #endLoopLeft#)
				</cfquery>
                  <!--- get right column hour content --->
                  <cfquery name="qGetHourRight" dbtype="query" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				SELECT * FROM qGetNewSched WHERE (runDate BETWEEN #startLoopRight# AND #endLoopRight#)
				</cfquery>
                  <!--- check if counter isn't 12 --->
                  <cfif cX NEQ 12>
                    <!--- it isn't, show am/pm --->
                    <tr>
                      <td class="planContentDateHour"><cfoutput>#cX#</cfoutput> am <br />
                        <table>
                          <tr>
                            <td class="planContentDateContent"><cfoutput>
                                <select name="content_#iX#">
                                  <option value="0">^ Prior Content ^</option>
                                  <cfloop query="qGetCategory">
                                    <option value="#qGetCategory.ucid#" <cfif qGetHourLeft.ucid EQ qGetCategory.ucid>selected="selected"</cfif>>#Decrypt(qGetCategory.categoryName,fishkey,'BLOWFISH','HEX')#</option>
                                  </cfloop>
                                </select>
                              </cfoutput></td>
                          </tr>
                        </table></td>
                      <td class="planContentDateHour"><cfoutput>#cX#</cfoutput> pm <br />
                        <table>
                          <tr>
                            <td class="planContentDateContent"><cfoutput>
                                <select name="content_#iX+12#">
                                  <option value="0">^ Prior Content ^</option>
                                  <cfloop query="qGetCategory">
                                    <option value="#qGetCategory.ucid#" <cfif qGetHourRight.ucid EQ qGetCategory.ucid>selected="selected"</cfif>>#Decrypt(qGetCategory.categoryName,fishkey,'BLOWFISH','HEX')#</option>
                                  </cfloop>
                                </select>
                              </cfoutput></td>
                          </tr>
                        </table></td>
                    </tr>
                    <!--- otherwise --->
                    <cfelse>
                    <!--- it is, show pm/am (for noon/midnight) --->
                    <tr>
                      <td class="planContentDateHour"><cfoutput>#cX#</cfoutput> pm <br />
                        <table>
                          <tr>
                            <td class="planContentDateContent"><cfoutput>
                                <select name="content_#iX#">
                                  <option value="0">^ Prior Content ^</option>
                                  <cfloop query="qGetCategory">
                                    <option value="#qGetCategory.ucid#" <cfif qGetHourLeft.ucid EQ qGetCategory.ucid>selected="selected"</cfif>>#Decrypt(qGetCategory.categoryName,fishkey,'BLOWFISH','HEX')#</option>
                                  </cfloop>
                                </select>
                              </cfoutput></td>
                          </tr>
                        </table></td>
                      <td class="planContentDateHour"><cfoutput>#cX#</cfoutput> am <br />
                        <table>
                          <tr>
                            <td class="planContentDateContent"><cfoutput>
                                <select name="content_#iX+12#">
                                  <option value="0">^ Prior Content ^</option>
                                  <cfloop query="qGetCategory">
                                    <option value="#qGetCategory.ucid#" <cfif qGetHourRight.ucid EQ qGetCategory.ucid>selected="selected"</cfif>>#Decrypt(qGetCategory.categoryName,fishkey,'BLOWFISH','HEX')#</option>
                                  </cfloop>
                                </select>
                              </cfoutput></td>
                          </tr>
                        </table></td>
                    </tr>
                  </cfif>
                </cfloop>
                <tr>
                  <td colspan="2" class="scheduleContentTd"><input type="image" src="../images/scheduleButton.gif" name="Submit" value="Update" style="text-align:center; margin-left:auto; margin-right:auto;" /></td>
                </tr>
              </table></td>
            <td class="newUserRight">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" class="newUserFooter">&nbsp;</td>
          </tr>
        </table></td>
      <td class="bodyRight">&nbsp;</td>
    </tr>
    <tr>
      <td class="bodyLeft">&nbsp;</td>
      <td class="navStyle"><cfoutput><a href="defaultCalendarWizard.cfm?d=#URL.d#"><img src="../images/calendarButton.gif" alt="Calendar Wizard" width="150" height="47" border="0" /></a></cfoutput><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
      <td class="bodyRight">&nbsp;</td>
    </tr>
  </table>
</form>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
