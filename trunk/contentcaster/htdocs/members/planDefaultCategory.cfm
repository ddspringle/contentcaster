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
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Schedule Default Content">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="scheduleAdminTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><!-- Plan Table -->
            <table>
              <tr>
                <td class="textTable"><!-- Left Column -->
                  <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                      <td class="planningTableTitle">Default Content</td>
                    </tr>
                    <tr>
                      <td class="planningTableText">Planning</td>
                    </tr>
                    <tr>
                      <td valign="top"><cfoutput>
                          <table width="225" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td class="planningTable"><a href="defaultCalendarWizard.cfm"><img src="../images/calendarWizardButton.gif" border="0" alt="Default Calendar Wizard" /></a> </td>
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
				  SELECT * FROM a_defaultcategoryschedule WHERE (runDate BETWEEN #startMonth# AND #endMonth#)
				  </cfquery>
                  <!--- Create a calendar object to display --->
                  <cfinvoke component="/components/calMonth" method="calMonth" calId="small" thisDate="#Now()#" dataQuery="#qGetSched#" dateColumn="runDate" nameColumn="ucid" showEvents="False" returnvariable="thisCal">
                  <cfoutput>#thisCal#</cfoutput> <br />
                  <!--- Display next month --->
                  <!--- Create date of next month --->
                  <cfset startMonth = CreateDateTime(thisYear, thisMonth+1, 1, 0, 0, 0)>
                  <cfset endMonth = CreateDateTime(thisYear, thisMonth+1, DaysInMonth(startMonth), 23, 59, 59)>
                  <!--- query all records in this month --->
                  <cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				  SELECT * FROM a_defaultcategoryschedule WHERE (runDate BETWEEN #startMonth# AND #endMonth#)
				  </cfquery>
                  <!--- Create a calendar object to display --->
                  <cfinvoke component="/components/calMonth" method="calMonth" calId="small" thisDate="#startMonth#" dataQuery="#qGetSched#" dateColumn="runDate" nameColumn="ucid" showEvents="False" returnvariable="thisCal">
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
    <td class="navStyle"><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
