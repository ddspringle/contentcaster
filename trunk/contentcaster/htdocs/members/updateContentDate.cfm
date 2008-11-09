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
<cfparam name="FORM.date" default="">
<!--- ensure proper values are passed --->
<cfif FORM.date EQ "" OR FORM.ucid EQ "">
  <!--- if not, redirect --->
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(FORM.ucid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- loop through hours in the day --->
<cfloop from="0" to="23" index="iX">
  <!--- set params --->
  <cfparam name="FORM['content_' & iX]" default="0">
</cfloop>
<!--- set start and end day --->
<cfset startDay = CreateDateTime(Year(FORM.date), Month(FORM.date), Day(FORM.date), 0, 0, 0)>
<cfset endDay = CreateDateTime(Year(FORM.date), Month(FORM.date), Day(FORM.date), 23, 59, 59)>
<!--- delete all events from the database for the passed date --->
<cfquery name="qDelEvents" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_categoryschedule WHERE (runDate BETWEEN '#DateFormat(startDay,'yyyy-mm-dd')# #TimeFormat(startDay,'HH:mm:ss')#' AND '#DateFormat(endDay,'yyyy-mm-dd')# #TimeFormat(endDay,'HH:mm:ss')#') AND ucid = '#newZ#'
</cfquery>
<!--- loop through hours --->
<cfloop from="0" to="23" index="iX">
  <!--- check if content was assigned --->
  <cfif FORM['content_' & iX] NEQ 0>
    <!--- insert into the database --->
    <cfquery name="qDelEvents" datasource="#ds#" username="#un#" password="#pw#">
INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newZ#', '#FORM['content_' & iX]#', '#DateFormat(CreateDateTime(Year(FORM.date), Month(FORM.date), Day(FORM.date), iX, 0, 0),'yyyy-mm-dd')# #TimeFormat(CreateDateTime(Year(FORM.date), Month(FORM.date), Day(FORM.date), iX, 0, 0),'HH:mm:ss')#')
</cfquery>
  </cfif>
</cfloop>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Update Content Success">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="scheduleUpdatedTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><table border="0" cellspacing="0" cellpadding="2" class="successTable">
              <tr>
                <td><cfoutput>Your content for the #Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')# category has been successfully scheduled in the database.</cfoutput></td>
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
    <td class="navStyle"><cfoutput><a href="planContentDate.cfm?z=#FORM.ucid#&amp;d=#FORM.date#"><img src="../images/contentButton.gif" alt="Daily Content" width="150" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
