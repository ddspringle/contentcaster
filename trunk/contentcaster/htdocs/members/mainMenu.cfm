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
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "#UCase(Left(level,1))##Right(level,len(level)-1)# Menu">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td class="mainMenuTd"><cfif level EQ "admin">
        <a href="inviteMember.cfm"><img src="../images/membersAdminButton.gif" alt="Members Admin" width="203" height="203" border="0" class="mainMenuButton" /></a> <a href="createCategory.cfm"><img src="../images/categoryAdminButton.gif" alt="Category Admin" width="203" height="203" border="0" class="mainMenuButton" /></a> <a href="planDefaultCategory.cfm"><img src="../images/scheduleAdminButton.gif" alt="Default Schedule Admin" width="203" height="203" border="0" class="mainMenuButton" /></a>
      </cfif>
      <cfif level EQ "user">
        <div style="text-align:center"><a href="createCategory.cfm"><img src="../images/categoryAdminButton.gif" alt="Category Admin" width="203" height="203" border="0" /></a><!---<a href="changePassword.cfm"><img src="../images/changePasswordButton.gif" alt="Change Password" width="203" height="203" border="0" class="mainMenuButton" /></a>---></div>
      </cfif>
    </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
