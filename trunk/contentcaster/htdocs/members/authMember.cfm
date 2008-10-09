<cfparam name="FORM.username" default="">
<cfparam name="FORM.password" default="">
<cfparam name="FORM.heartbeat" default="">
<cfparam name="COOKIE.ccast_sessionId" default="">
<!--- do error checks here --->
<cfif FORM.username EQ "" OR FORM.password EQ "" OR FORM.heartbeat EQ "">
  <cflocation url="index.cfm?err=1">
</cfif>
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- encrypt the username for database retreival --->
<cfset FORM.username = Encrypt(FORM.username,fishkey,'BLOWFISH','HEX')>
<!--- query userbase for username --->
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE username = '#FORM.username#'
</cfquery>
<!--- check for existing record, if no record then error --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="index.cfm?err=3">
</cfif>
<!--- check password --->
<cfset decPwd = Decrypt(qGetMember.password,fishkey,'BLOWFISH','HEX')>
<cfset compTemp = lcase(decPwd) & FORM.heartbeat>
<cfset compPwd = Hash(compTemp, 'MD5')>
<cfif FORM.password NEQ compPwd>
  <cflocation url="index.cfm?err=4">
</cfif>
<!--- generate session id --->
<cfset sessid = CreateUUID()>
<!--- encrypt the user id --->
<cfset encUuid = Encrypt(qGetMember.uuid,fishkey,'BLOWFISH','HEX')>
<!--- insert sessid and encUuid into session table --->
<cfquery name="qPutSession" datasource="#ds#" username="#un#" password="#pw#">
INSERT INTO a_sessionbase (usid, uuid, lastAction) VALUES ('#sessid#', '#encUuid#', '#DateFormat(Now(),'yyyy-mm-dd')# #TimeFormat(Now(),'HH:mm:ss')#')
</cfquery>
<!--- encrypt session id for cookie --->
<cfset encSess = Encrypt(sessid,fishkey,'BLOWFISH','HEX')>
<!--- delete previous cookie --->
<cfcookie name="ccast_sessionId" value="*" expires="now">
<!--- set new ccast_sessionId cookie --->
<cfcookie name="ccast_sessionId" value="#encSess#" expires="#DateFormat(DateAdd('d',1,Now()),'mm/dd/yy')#">
<!--- update member lastOn statistics --->
<cfquery name="qUpdMember" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_userbase SET lastOn = '#DateFormat(Now(),'yyyy-mm-dd')# #TimeFormat(Now(),'HH:mm:ss')#' WHERE uuid = '#qGetMember.uuid#'
</cfquery>
<!--- redirect to main menu --->
<cflocation url="mainMenu.cfm">
