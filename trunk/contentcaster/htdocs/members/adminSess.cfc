<cfcomponent>
<cffunction name="adminSess" access="public" returntype="array">
  <cfargument name="tcCookie" type="string" required="yes">
  <!--- include application --->
  <cfinclude template="../Application.cfm">
  <!--- setup usid --->
  <cfset usid = Decrypt(tcCookie,fishkey,'BLOWFISH','HEX')>
  <!--- setup array --->
  <cfset rA = ArrayNew(1)>
  <!--- query session database for current session --->
  <cfquery name="qGetSession" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_sessionbase WHERE usid = '#usid#'
  </cfquery>
  <!--- check if session exists --->
  <cfif qGetSession.RecordCount EQ 0>
    <!--- if not, return an error --->
    <cfset rA[1] = "invalid">
    <cfset rA[2] = 0>
    <cfreturn rA>
  </cfif>
  <!--- check if session has timed out --->
  <cfif DateCompare(DateAdd('m',tout,qGetSession.lastAction),Now()) LT 0>
    <!--- it has, return an error --->
    <cfset rA[1] = "timeout">
    <cfset rA[2] = 0>
    <cfreturn rA>
  </cfif>
  <!--- passed tests, reset last action and cookie --->
  <!--- update session table --->
  <cfquery name="qUpdSession" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_sessionbase SET lastAction = '#DateFormat(Now(),'yyyy-mm-dd')# #TimeFormat(Now(), 'HH:mm:ss')#' WHERE usid = '#usid#'
  </cfquery>
  <!--- encrypt session id for cookie --->
  <cfset encSess = Encrypt(usid,fishkey,'BLOWFISH','HEX')>
  <!--- delete previous cookie --->
  <cfcookie name="ccast_sessionId" value="*" expires="now">
  <!--- set updated ccast_sessionId cookie --->
  <cfcookie name="ccast_sessionId" value="#encSess#" expires="#DateFormat(DateAdd('d',1,Now()),'mm/dd/yy')#">
  <!--- decrypt the user id --->
  <cfset rA[1] = Decrypt(qGetSession.uuid,fishkey,'BLOWFISH','HEX')>
  <!--- query user id for level --->
  <cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#rA[1]#'
  </cfquery>
  <!--- return information --->
  <cfset rA[2] = qGetMember.level>
  <cfreturn rA>
</cffunction>
</cfcomponent>
