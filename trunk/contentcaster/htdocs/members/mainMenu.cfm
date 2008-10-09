<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cfset level = "user">
  <cfelse>
  <cfset level = "admin">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "#UCase(Left(level,1))##Right(level,len(level)-1)# Menu">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif" width="3"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" width="696"><cfif level EQ "admin">
        <a href="inviteMember.cfm"><img src="../images/membersAdminButton.gif" alt="Members Admin" width="203" height="203" border="0" style="padding-left: 30px;"/></a> <a href="createCategory.cfm"><img src="../images/categoryAdminButton.gif" alt="Category Admin" width="203" height="203" border="0" style="padding-left: 30px;" /></a> <a href="planDefaultCategory.cfm"><img src="../images/scheduleAdminButton.gif" alt="Default Schedule Admin" width="203" height="203" border="0" style="padding-left: 30px;" /></a>
      </cfif>
      <cfif level EQ "user">
        <div style="text-align:center"><a href="createCategory.cfm"><img src="../images/categoryAdminButton.gif" alt="Category Admin" width="203" height="203" border="0" /></a><a href="changePassword.cfm"><img src="../images/changePasswordButton.gif" alt="Change Password" width="203" height="203" border="0" style="padding-left: 30px;" /></a></div>
      </cfif>
    </td>
    <td background="../images/bodySpacer_right.gif" width="3"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
