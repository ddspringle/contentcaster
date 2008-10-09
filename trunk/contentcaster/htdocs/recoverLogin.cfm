<!--- set params --->
<cfparam name="URL.action" type="string" default="recover">
<cfparam name="URL.err" default="">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "We do not have a record of a user with that email address on file. The email address you enter here must match the email address currently on file with <cfoutput>#siteTitle#</cfoutput>. If you have lost access to the email address you used with <cfoutput>#siteTitle#</cfoutput>, please email <a href='mailto:#fromEmail#'>#fromEmail#</a> for further assistance.Please validate your information and try again.">
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
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="images/bodySpacer_left.gif"><img src="images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="images/passwordRecoveryBoxTitle.gif" alt="Recover Password" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="images/newUserBox_left.gif"><img src="images/newUserBox_left.gif" /></td>
          <td class="textTable" width="655"><cfif URL.action EQ "recover">
              Our password recovery is very simple. Simply enter your email address and click 'Recover'. We will generate a new random password and email it to the email address you provide.
              </p>
              <br />
              <!--- display any error messages, will be blank if none --->
              <br />
              <cfoutput>#errorText#</cfoutput>
              <form action="/loginRecovery.cfm" method="post" name="loginRecovery" id="loginRecovery">
                <table width="100%" border="0" cellpadding="2" cellspacing="2">
                  <tr>
                    <td width="18%" class="boldText">Email Address:&nbsp;</td>
                    <td width="82%"><input type="text" name="email" size="60" /></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><input name="submit" type="image" value="Recover" src="images/recoverButton.gif" alt="Recover" width="79" hspace="0" /></td>
                  </tr>
                </table>
              </form>
              <cfelse>
              Your password has been successfully changed to a system generated password and an email sent to your email address with your updated information. Please refer to this email and then <a href="members/login.cfm">Login</a> to continue.</a>
            </cfif></td>
          <td background="images/newUserBox_right.gif"><img src="images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="images/newUserBoxFooter.gif" /></td>
        </tr>
      </table></td>
    <td background="images/bodySpacer_right.gif"><img src="images/bodySpacer_right.gif" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="includes/footer.cfm">
