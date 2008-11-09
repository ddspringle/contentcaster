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
<cfparam name="URL.d" default="#DateFormat(Now(),'yyyy-mm-dd')#">
<cfparam name="URL.rc" default="">
<cfparam name="thisYear" default="#Year(DateFormat(URL.d,'yyyy-mm-dd'))#">
<cfparam name="thisMonth" default="#Month(DateFormat(URL.d,'yyyy-mm-dd'))#">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into all of the fields and click submit to proceed.">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
SELECT * FROM a_categorybase
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Default Calendar Wizard">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><cfif URL.rc NEQ "">
        <div class="loginError"><cfoutput>#URL.rc#</cfoutput> days were modified during the last update.</div>
        <br />
        <br />
      </cfif>
      <table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="calendarWizardTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="calTableCenter"><table>
              <tr>
                <td><cfoutput><a href="#CGI.SCRIPT_NAME#?d=#DateFormat(DateAdd('m',-1,CreateDate(thisYear,thisMonth,1)),'yyyy-mm-dd')#" class="calNavigation">Last Month</a></cfoutput></td>
                <td>&nbsp;</td>
                <td><cfoutput><a href="#CGI.SCRIPT_NAME#?d=#DateFormat(DateAdd('m',1,CreateDate(thisYear,thisMonth,1)),'yyyy-mm-dd')#" class="calNavigation">Next Month</a></cfoutput></td>
              </tr>
              <tr>
                <td colspan="3"><!--- Display this month --->
                  <!--- Create start and end of this month --->
                  <cfset startMonth = CreateDateTime(thisYear, thisMonth, 1, 0, 0, 0)>
                  <cfset endMonth = CreateDateTime(thisYear, thisMonth, DaysInMonth(startMonth), 23, 59, 59)>
                  <!--- query all records in this month --->
                  <cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				  SELECT * FROM a_defaultcategoryschedule WHERE (runDate BETWEEN #startMonth# AND #endMonth#)
				  </cfquery>
                  <!--- get content for this category --->
                  <cfquery name="qGetCategory" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
				  SELECT * FROM a_categorybase
				  </cfquery>
                  <!--- join content to schedule --->
                  <cfquery name="qGetNewSched" dbtype="query" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
                  SELECT * FROM qGetSched, qGetCategory WHERE qGetSched.ucid = qGetCategory.ucid ORDER BY runDate
                  </cfquery>
                  <!--- decrypt and format category name --->
                  <!--- loop over the query --->
                  <cfloop query="qGetNewSched">
                  <!--- format with time and decrypted category name --->
                  <cfset qGetNewSched.categoryName = LCase(TimeFormat(qGetNewSched.runDate,'ht')) & ' ' & Decrypt(qGetNewSched.categoryName,fishkey,'BLOWFISH','HEX')>
                  <!--- next or end --->
                  </cfloop>
                  
                  <!--- Create a calendar object to display --->
                  <cfinvoke component="/components/calMonth" method="calMonth" calId="large" thisDate="#startMonth#" dataQuery="#qGetNewSched#" dateColumn="runDate" nameColumn="categoryName" showEvents="True" dateCallback="planDefaultContentDate.cfm" dateCallbackField="d" dayFormat="3" returnvariable="thisCal" decryptName="True" encryptKey="#fishkey#" encryptAlg="BLOWFISH" encryptEnc="HEX"> 
				  
				  <cfoutput>#thisCal#</cfoutput> </td>
              </tr>
              <!---<tr>
            <td colspan="3"><cfoutput>
                <input type="image" src="../images/scheduleButton.gif" name="submit" value="Schedule #DateFormat(URL.d,'MMMMMM')#" />
              </cfoutput> </td>
          </tr>--->
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
    <td class="navStyle"><a href="planDefaultCategory.cfm"><img src="../images/plannerButton.gif" alt="Plan Default Category" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
