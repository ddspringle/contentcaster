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
<cfparam name="FORM.email">
<!--- encrypt email --->
<cfset thisEmail = Encrypt(Trim(FORM.email),fishkey,'BLOWFISH','HEX')>
<!--- query database for userid --->
<cfquery name="qGetUser" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE username = '#thisEmail#'
</cfquery>
<!--- check if no records --->
<cfif qGetUser.RecordCount EQ 0>
  <cflocation url="recoverLogin.cfm?err=1">
</cfif>
<!--- get random password UPPERCASE and lowercase 10 chars long --->
<cfinvoke component="/components/randomPassword" method="randomPassword" returnvariable="password" useLower=1 useNumeric=0 useUpper=1 useSpecial=0 passLength="10">
<!--- hash the password --->
<cfset hashPwd = Lcase(Hash(password,'MD5'))>
<!--- set encrypted password --->
<cfset newPass = Encrypt(hashPwd,qGetUser.username,ad,eh)>
<cfset newPass = Encrypt(newPassOne,fishkey,'BLOWFISH','HEX')>
<!--- update database --->
<cfquery name="qUpdUser" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
UPDATE a_userbase SET password = '#newPass#' WHERE uuid = '#qGetUser.uuid#'
</cfquery>
<!--- decrypt required values --->
<cfset qGetUser.username = Decrypt(qGetUser.username,fishkey,'BLOWFISH','HEX')>
<cfset qGetUser.firstName = Decrypt(qGetUser.firstName,fishkey,'BLOWFISH','HEX')>
<cfset qGetUser.lastName = Decrypt(qGetUser.lastName,fishkey,'BLOWFISH','HEX')>
<!--- send email --->
<!--- send email to new member --->
<cfmail from="#fromEmail#" to="#FORM.email#" bcc="#bccEmail#" server="#mailServer#" port="#mailPort#" username="#mailUser#" password="#mailPass#" type="html" mailerid="<cfoutput>#siteTitle#</cfoutput> v#version#" subject="Your <cfoutput>#siteTitle#</cfoutput> Account">
  <html>
  <head>
  <title></title>
  </head>
  <body>
  <p>Dear #qGetUser.firstName# #qGetUser.lastName#,</p>
  <p>You're #siteTitle# password has been changed to a system generated password at your request. Once logged in you can change your password at any time from the menu. Please use the following information to login:</p>
  <p>Username:&nbsp;&nbsp;#qGetUser.username#<br>
    Password:&nbsp;&nbsp;#password#</p>
  <p>To login, please visit:</p>
  <a href="#loginURL#" target="_blank">#loginURL#</a>
  </body>
  </html>
</cfmail>
<cflocation url="/recoverLogin.cfm?action=success">
