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
<cfparam name="FORM.firstName" default="">
<cfparam name="FORM.lastName" default="">
<cfparam name="FORM.email" default="">
<cfparam name="FORM.level" default="0">
<!--- check for data --->
<cfif FORM.firstName EQ "" OR FORM.lastName EQ "" OR FORM.email EQ "" OR FORM.level EQ "">
  <cflocation url="inviteMember.cfm?err=1">
</cfif>
<!--- ensure a unique email address --->
<cfquery name="qGetEmail" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE username = '#Encrypt(FORM.email,fishkey,'BLOWFISH','HEX')#'
</cfquery>
<cfif qGetEmail.RecordCount GT 0>
  <cflocation url="inviteMember.cfm?err=1">
</cfif>
<!--- generate member data --->
<!--- generate unique user id --->
<cfset uuid = CreateUUID()>
<!--- generate random password of random length --->
<cfinvoke component="/components/randomPassword" method="randomPassword" returnvariable="userPass" useLower=1 useUpper=1 useNumeric=1 useSpecial=0 passLength="#RandRange(7,14)#">
<!--- hash the random password --->
<cfset hashPass = Hash(userPass,'MD5')>
<!--- encrypt the username for database storage --->
<cfset userName = Encrypt(FORM.email,fishkey,'BLOWFISH','HEX')>
<!--- encrypt the hashed password for database storage --->
<cfset encPass = Encrypt(hashPass,fishkey,'BLOWFISH','HEX')>
<!--- encrypt the firstName for database storage --->
<cfset dbFirstName = Encrypt(FORM.firstName,fishkey,'BLOWFISH','HEX')>
<!--- encrypt the lastName for database storage --->
<cfset dbLastName = Encrypt(FORM.lastName,fishkey,'BLOWFISH','HEX')>
<!--- create member account --->
<cfquery name="qPutMember" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
INSERT INTO a_userbase (uuid, username, password, firstName, lastName, level, memberSince, lastOn) VALUES ('#uuid#', '#userName#', '#encPass#', '#dbFirstName#', '#dbLastName#', '#FORM.level#', '#DateFormat(Now(),'yyyy-mm-dd')#', '1900-01-01 00:00:00')
</cfquery>
<!--- send email to new member --->
<cfmail from="#fromEmail#" to="#FORM.email#" bcc="#bccEmail#" server="#mailServer#" port="#mailPort#" username="#mailUser#" password="#mailPass#" type="html" mailerid="<cfoutput>#siteTitle#</cfoutput> v#version#" subject="#joinSubject#">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title></title>
  </head>
  <body>
  <p>Dear #FORM.firstName# #FORM.lastName#,</p>
  <p>You have been invited by #companyName# to join the #siteTitle# network. We have assigned your username to your email address and provided a system generated password for your initial login. Once logged in you can change your password at any time from the menu. Please use the following information to login:</p>
  <p>Username:&nbsp;&nbsp;#FORM.email#<br />
    Password:&nbsp;&nbsp;#userPass#</p>
  <p>To login, please visit:</p>
  <a href="#loginURL#" target="_blank">#loginURL#</a>
  </body>
  </html>
</cfmail>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Invite Sent">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3"><img src="../images/newUserBoxTitle.gif" alt="New Member" width="673" height="54" /></td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"> Successfully sent an invite to <cfoutput>#FORM.email#</cfoutput>. <br />
            <br />
          </td>
          <td class="newUserRight">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" class="newUserFooter">&nbsp;</td>
        </tr>
      </table>
      <br />
      <br />
      <a href="inviteMember.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/inviteMemberButton.gif" alt="Invite Member" width="140" height="47" border="0" /></a> <a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
