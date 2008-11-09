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
<cfparam name="URL.err" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="/components/adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cflocation url="index.cfm?err=5">
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
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<script type="text/javascript" src="../js/md5.js"></script>
<script type="text/javascript" language="JavaScript">
function hashIt() {
document.forms[0].oldPassword.value = hex_md5(document.forms[0].oldPassword.value);
document.forms[0].newPassword.value = hex_md5(document.forms[0].newPassword.value);
document.forms[0].verifyPassword.value = hex_md5(document.forms[0].verifyPassword.value);
}
</script>
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="changePasswordTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td style="padding-top:10px;" class="textTable"><table cellpadding="0" cellspacing="0" border="0" class="textTable">
              <tr>
                <td><div style="padding-left:5px">
                    <cfif errorText NEQ "">
                      <div class="loginError"><cfoutput>#errorText#</cfoutput></div>
                      <br />
                    </cfif>
                    <form action="updatePassword.cfm" method="post" onsubmit="hashIt()">
                      <table>
                        <tr>
                          <td class="boldText">Old Password:</td>
                          <td><input type="password" name="oldPassword" id="oldPassword" class="loginBox"/></td>
                        </tr>
                        <tr>
                          <td class="boldText"> New Password:</td>
                          <td><input type="password" name="newPassword" id="newPassword" class="loginBox"/></td>
                        </tr>
                        <tr>
                          <td class="boldText">Verify Password:</td>
                          <td><input type="password" name="verifyPassword" id="verifyPassword" class="loginBox"/></td>
                        </tr>
                        <tr>
                          <td colspan="2"><input src="../images/changeButton.gif" type="image" name="Submit" value="Update" style="padding-left: 120px;"/></td>
                        </tr>
                      </table>
                    </form>
                  </div></td>
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
    <td class="navStyle"><a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
