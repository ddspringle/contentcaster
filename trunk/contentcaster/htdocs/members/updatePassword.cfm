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
<cfif auth[1] EQ "invalid" OR auth[1] EQ "timeout">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- set params --->
<cfparam name="FORM.oldPassword" default="">
<cfparam name="FORM.newPassword" default="">
<cfparam name="FORM.verifyPassword" default="">
<!--- query userbase for username --->
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#auth[1]#'
</cfquery>
<!--- check for existing record, if no record then error --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="index.cfm?err=3">
</cfif>
<!--- check password --->
<cfset decPwd = Decrypt(qGetMember.password,fishkey,'BLOWFISH','HEX')>
<cfif FORM.oldPassword NEQ decPwd>
  <cflocation url="changePassword.cfm?err=1">
</cfif>
<!--- verify new password --->
<cfif FORM.newPassword NEQ FORM.verifyPassword>
  <cflocation url="changePassword.cfm?err=2">
</cfif>
<!--- update database --->
<cfquery name="qUpdMember" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_userbase SET password = '#Encrypt(FORM.newPassword,fishkey,'BLOWFISH','HEX')#' WHERE uuid = '#auth[1]#'
</cfquery>
<!--- delete previous cookie --->
<cfcookie name="ccast_sessionId" value="*" expires="now">
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Password Updated">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/passwordUpdateSuccessBoxTitle.gif" alt="Password Updated" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
              <tr>
                <td><div style="font-family:Verdana, Arial, Helvetica, sans-serif; font-weight:bold; font-size:10pt; padding-left: 5px;"> <cfoutput>Your password has been successfully changed. Please <a href="index.cfm">Login</a> again to verify your new password. If you experience any difficulties with your new password please send an email to <a href="mailto:#fromEmail#">#fromEmail#</a> to have your password automatically regenerated. <br />
                    </cfoutput> </div></td>
              </tr>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
