<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
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
<!--- set params --->
<cfparam name="FORM.xDate" default="#DateFormat(Now(),'yyyy-mm-dd')#">
<cfparam name="FORM.ucid" default="">
<!--- check for existence of ucid --->
<cfif FORM.ucid EQ "">
  <!--- if null, redirect --->
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newUsid = Decrypt(Decrypt(FORM.ucid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- delete all contents for this month --->
<cfquery name="qDelSeq" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_categoryschedule WHERE ucid = '#newUsid#' AND runDate >= '#DateFormat(FORM.xDate,'yyyy-mm-01')#' AND runDate <= '#DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),DaysInMonth(FORM.xDate)),'yyyy-mm-dd')#'
</cfquery>
<!--- set up counter --->
<cfset iX = 0>
<!--- main loop - loop through all dates and update as needed --->
<cfloop from="1" to="#DaysInMonth(FORM.xDate)#" index="thisDay">
  <!--- configure params to avoid errors for missing values --->
  <cfparam name="FORM[DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),thisDay),'yyyy-mm-dd')]" default="">
  <!--- check if value exists for this iteration of FORM[date] --->
  <cfif FORM[DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),thisDay),'yyyy-mm-dd')] NEQ "">
    <!--- not a null value, so process --->
    <!--- insert into database --->
    <cfquery name="qPutSched" datasource="#ds#" username="#un#" password="#pw#">
INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newUsid#', '#FORM[DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),thisDay),'yyyy-mm-dd')]#', '#DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),thisDay),'yyyy-mm-dd')#')
    </cfquery>
    <!--- increment counter --->
    <cfset iX = iX + 1>
    <!--- finished checking for value of FORM[date] iterations --->
  </cfif>
  <!--- loop back till done --->
</cfloop>
<!--- redirect back to calendar wizard --->
<cflocation url="calendarWizard.cfm?z=#FORM.ucid#&amp;d=#FORM.xDate#&amp;rc=#iX#">
