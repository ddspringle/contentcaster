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
<cfparam name="URL.err" default="">
<cfparam name="URL.z" default="">
<cfparam name="thisDate" default="#Now()#">
<cfparam name="thisYear" default="#Year(thisDate)#">
<cfparam name="thisMonth" default="#Month(thisDate)#">
<cfset endRow = "</tr><tr>">
<cfset endCal = "">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into all of the fields and click submit to proceed.">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- check for existence of 'z' --->
<cfif URL.z EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Schedule Category">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="plannerTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><!-- Plan Table -->
            <table>
              <tr>
                <td><!-- Left Column -->
                  <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                      <td class="planningTableTitle"><cfoutput>#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                    </tr>
                    <tr>
                      <td class="planningTableText">Planning</td>
                    </tr>
                    <tr>
                      <td valign="top"><cfoutput>
                          <table width="225" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td class="planningTable"><a href="scheduleWizard.cfm?z=#URL.z#"><img src="../images/scheduleWizardButton.gif" border="0" alt="Schedule Wizard" /></a></td>
                            </tr>
                            <tr>
                              <td class="planningTable"><a href="calendarWizard.cfm?z=#URL.z#"><img src="../images/calendarWizardButton.gif" border="0" alt="Calendar Wizard" /></a> </td>
                            </tr>
                          </table>
                        </cfoutput> </td>
                    </tr>
                    <tr>
                      <td class="planningTableText">Content Management</td>
                    </tr>
                    <tr>
                      <td valign="top"><cfoutput>
                          <table width="225" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td class="planningTable"><a href="uploadContent.cfm?z=#URL.z#"><img src="../images/uploadContentButton.gif" border="0" alt="Upload Content" /></a></td>
                            </tr>
                            <tr>
                              <td class="planningTable"><a href="listContent.cfm?z=#URL.z#"><img src="../images/manageContentButton.gif" border="0" alt="Manage Content" /></a> </td>
                            </tr>
                          </table>
                        </cfoutput> </td>
                    </tr>
                  </table>
                  <!-- End Left Column -->
                </td>
                <td class="plannerTable"><!-- Start Right Column -->
                  <div class="planningTableText">Schedule</div>
                  <br />
                  <!--- Display this month --->
                  <!--- Create start and end of this month --->
                  <cfset startMonth = CreateDateTime(thisYear, thisMonth, 1, 0, 0, 0)>
                  <cfset endMonth = CreateDateTime(thisYear, thisMonth, DaysInMonth(startMonth), 23, 59, 59)>
                  <!--- query all records in this month --->
                  <cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				  SELECT * FROM a_categoryschedule WHERE ucid = '#newZ#' AND (runDate BETWEEN #startMonth# AND #endMonth#)
				  </cfquery>
                  <!--- Create a calendar object to display --->
                  <cfinvoke component="/components/calMonth" method="calMonth" calId="small" thisDate="#Now()#" dataQuery="#qGetSched#" dateColumn="runDate" nameColumn="contentId" showEvents="False" returnvariable="thisCal">
                  <cfoutput>#thisCal#</cfoutput> <br />
                  <!--- Display next month --->
                  <!--- Create date of next month --->
                  <cfset startMonth = CreateDateTime(thisYear, thisMonth+1, 1, 0, 0, 0)>
                  <cfset endMonth = CreateDateTime(thisYear, thisMonth+1, DaysInMonth(startMonth), 23, 59, 59)>
                  <!--- query all records in this month --->
                  <cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				  SELECT * FROM a_categoryschedule WHERE ucid = '#newZ#' AND (runDate BETWEEN #startMonth# AND #endMonth#)
				  </cfquery>
                  <!--- Create a calendar object to display --->
                  <cfinvoke component="/components/calMonth" method="calMonth" calId="small" thisDate="#startMonth#" dataQuery="#qGetSched#" dateColumn="runDate" nameColumn="contentId" showEvents="False" returnvariable="thisCal">
				  <cfoutput>#thisCal#</cfoutput> </td>
                <!-- end right column -->
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
    <td class="navStyle"><a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0"/></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
