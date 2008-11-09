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
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE uuid = '#uuid#'
</cfquery>
<!--- check for existence of record --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="listMembers.cfm?err=1">
</cfif>
<!--- check if new password required --->
<cfif FORM.newPass EQ 1>
  <!--- generate random password of random length --->
  <cfinvoke component="/components/randomPassword" method="randomPassword" returnvariable="userPass" useLower=1 useUpper=1 useNumeric=1 useSpecial=0 passLength="#RandRange(7,14)#">
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
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="memberUpdateSuccessTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="successTable">Successfully updated the member, <cfoutput>#FORM.email#</cfoutput>.</td>
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
    <td class="navStyle"><a href="listMembers.cfm"><img src="../images/membersButton.gif" alt="Member List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
