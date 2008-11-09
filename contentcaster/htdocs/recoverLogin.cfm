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
<!--- set params --->
<cfparam name="URL.action" type="string" default="recover">
<cfparam name="URL.err" default="">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = 'We do not have a record of a user with that email address on file.<br /><br />Please validate your information and try again.'>
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Recover Login">
<!--- include the header template --->
<cfinclude template="includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="passwordRecoveryTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><table border="0" cellspacing="0" cellpadding="2" class="textTable">
              <tr>
                <td><!--- display error text, if any --->
                  <cfif URL.err NEQ "">
                    <div class="loginError"> <cfoutput>#errorText#</cfoutput> </div>
                  </cfif>
                  <br />
                  <br />
                  <cfif URL.action EQ "recover">
                    Our password recovery is very simple. Simply enter your email address and click 'Recover'. We will generate a new random password and email it to the email address you provide. <br />
                    <br />
                    <form action="/loginRecovery.cfm" method="post" name="loginRecovery" id="loginRecovery">
                      <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                          <td width="18%" class="boldText">Email Address:&nbsp;</td>
                          <td width="82%"><input type="text" name="email" size="60" /></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><input name="submit" type="image" value="Recover" src="images/recoverButton.gif" alt="Recover" /></td>
                        </tr>
                      </table>
                    </form>
                    <cfelse>
                    Your password has been successfully changed to a system generated password and an email sent to your email address with your updated information. Please refer to this email and then <a href="members/login.cfm">Login</a> to continue.</a>
                  </cfif></td>
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
    <td class="navStyle">&nbsp;</td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="includes/footer.cfm">
