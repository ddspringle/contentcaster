<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfparam name="URL.err" default="">
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
<!--- check for errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "Your old password does not match the password we have on file for your account. Please verify your password and try again.">
    <cfelseif URL.err EQ 2>
    <cfset errorText = "The values you entered for your new password and verification password did not match. Please enter the same value for both of these fields.">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Update Your Password">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<script type="text/javascript" src="../js/md5.js"></script>
<script type="text/javascript" language="javascript">
function hashIt() {
document.forms[0].oldPassword.value = hex_md5(document.forms[0].oldPassword.value);
document.forms[0].newPassword.value = hex_md5(document.forms[0].newPassword.value);
document.forms[0].verifyPassword.value = hex_md5(document.forms[0].verifyPassword.value);
}
</script>
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/changePasswordBoxTitle.gif" alt="Change Password" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="667"><table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
              <tr>
                <td><div style="padding-left:5px">
                    <cfif errorText NEQ "">
                      <div style="background-color:#FFFFFF; color:#FF0000; font-weight:bold; padding:5px;"><cfoutput>#errorText#</cfoutput></div>
                      <br />
                    </cfif>
                    <form action="updatePassword.cfm" method="post" onsubmit="hashIt()">
                      Old Password:<br />
                      <input type="password" name="oldPassword" id="oldPassword" border="1" size="50"/>
                      <br />
                      <br />
                      New Password:<br />
                      <input type="password" name="newPassword" id="newPassword" border="1" size="50"/>
                      <br />
                      <br />
                      Verify Password<br />
                      <input type="password" name="verifyPassword" id="verifyPassword" border="1" size="50"/>
                      <p>
                        <input src="../images/changeButton.gif" type="image" name="Submit" value="Update" style="padding-left: 70px;"/>
                      </p>
                    </form>
                  </div></td>
              </tr>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/newCategoryButton.gif" border="0" /></a><a href="listCategories.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/categoryListButton.gif" border="0" /></a><a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
