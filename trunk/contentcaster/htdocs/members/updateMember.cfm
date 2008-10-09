<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cflocation url="index.cfm?err=5">
</cfif>
<!--- set params --->
<cfparam name="FORM.uuid" default="">
<cfparam name="FORM.firstName" default="">
<cfparam name="FORM.lastName" default="">
<cfparam name="FORM.email" default="">
<cfparam name="FORM.level" default="0">
<cfparam name="FORM.newPass" default="0">
<!--- check for data --->
<cfif FORM.firstName EQ "" OR FORM.lastName EQ "" OR FORM.email EQ "" OR FORM.level EQ "">
  <cflocation url="editMember.cfm?err=1">
</cfif>
<cfif FORM.uuid EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- set-up uuid variable --->
<cfset uuid = Decrypt(Decrypt(FORM.uuid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- query db for user --->
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#uuid#'
</cfquery>
<!--- check for existence of record --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="listMembers.cfm?err=1">
</cfif>
<!--- check if new password required --->
<cfif FORM.newPass EQ 1>
  <!--- generate random password of random length --->
  <cfinvoke component="randomPassword" method="randomPassword" returnvariable="userPass" useLower=1 useUpper=1 useNumeric=1 useSpecial=0 passLength="#RandRange(7,14)#">
  <!--- hash the random password --->
  <cfset hashPass = Hash(userPass,'MD5')>
  <!--- encrypt the hashed password for database storage --->
  <cfset encPass = Encrypt(hashPass,fishkey,'BLOWFISH','HEX')>
  <cfelse>
  <cfset encPass = qGetMember.password>
</cfif>
<!--- encrypt the username for database storage --->
<cfset userName = Encrypt(FORM.email,fishkey,'BLOWFISH','HEX')>
<!--- encrypt the firstName for database storage --->
<cfset dbFirstName = Encrypt(FORM.firstName,fishkey,'BLOWFISH','HEX')>
<!--- encrypt the lastName for database storage --->
<cfset dbLastName = Encrypt(FORM.lastName,fishkey,'BLOWFISH','HEX')>
<!--- create member account --->
<cfquery name="qPutMember" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_userbase SET username = '#userName#', password = '#encPass#', firstName = '#dbFirstName#', lastName = '#dbLastName#', level = '#FORM.level#' WHERE uuid = '#uuid#'
</cfquery>
<!--- check if username different or new password requested --->
<cfif FORM.newPass EQ 1>
  <!--- send update email to member when password has changed --->
  <!--- (will also provide username change info if done with the password change) --->
  <cfmail from="#fromEmail#" to="#FORM.email#" bcc="#bccEmail#" server="#mailServer#" port="#mailPort#" username="#mailUser#" password="#mailPass#" type="html" mailerid="<cfoutput>#siteTitle#</cfoutput> v#version#" subject="#updateSubject#">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title></title>
    </head>
    <body>
    <p>Dear #FORM.firstName# #FORM.lastName#,</p>
    <p>Your #siteTitle# network username and/or password have been changed by an administrator. Please use the following information to login from now on:</p>
    <p>Username:&nbsp;&nbsp;#FORM.email#<br />
      Password:&nbsp;&nbsp;#userPass#</p>
    <p>To login, please visit:</p>
    <a href="#loginURL#" target="_blank">#loginURL#</a>
    </body>
    </html>
  </cfmail>
  <cfelseif FORM.email NEQ Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX') AND FORM.newPass EQ 0>
  <!--- send update email to member when only username has changed --->
  <cfmail from="#fromEmail#" to="#FORM.email#" bcc="#bccEmail#" server="#mailServer#" port="#mailPort#" username="#mailUser#" password="#mailPass#" type="html" mailerid="<cfoutput>#siteTitle#</cfoutput> v#version#" subject="#updateSubject#">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title></title>
    </head>
    <body>
    <p>Dear #FORM.firstName# #FORM.lastName#,</p>
    <p>Your #siteTitle# network username has been changed by an administrator. Please use the following information to login from now on:</p>
    <p>Username:&nbsp;&nbsp;#FORM.email#<br />
      Password:&nbsp;&nbsp;**unchanged** use current password!</p>
    <p>To login, please visit:</p>
    <a href="#loginURL#" target="_blank">#loginURL#</a>
    </body>
    </html>
  </cfmail>
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Member Updated">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/memberUpdateSuccessBoxTitle.gif" alt="Member Updated" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
              <tr>
                <td><div style=" font-family:Verdana, Arial, Helvetica, sans-serif; font-weight:bold; font-size:12; padding-left: 40px;"> Successfully updated the member, <cfoutput>#FORM.email#</cfoutput>. </div>
                </td>
              </tr>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="listMembers.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/membersButton.gif" alt="Member List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
