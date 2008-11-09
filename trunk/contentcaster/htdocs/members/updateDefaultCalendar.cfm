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
<cfparam name="FORM.xDate" default="#DateFormat(Now(),'yyyy-mm-dd')#">
<!--- delete all contents for this month --->
<cfquery name="qDelSeq" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
DELETE FROM a_defaultcategoryschedule WHERE runDate >= '#DateFormat(FORM.xDate,'yyyy-mm-01')#' AND runDate <= '#DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),DaysInMonth(FORM.xDate)),'yyyy-mm-dd')#'
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
    <cfquery name="qPutSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
INSERT INTO a_defaultcategoryschedule (udefid, ucid, runDate) VALUES ('#CreateUUID()#', '#FORM[DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),thisDay),'yyyy-mm-dd')]#',  '#DateFormat(CreateDate(DateFormat(FORM.xDate,'yyyy'),DateFormat(FORM.xDate,'mm'),thisDay),'yyyy-mm-dd')#')
    </cfquery>
    <!--- increment counter --->
    <cfset iX = iX + 1>
    <!--- finished checking for value of FORM[date] iterations --->
  </cfif>
  <!--- loop back till done --->
</cfloop>
<!--- redirect back to calendar wizard --->
<cflocation url="defaultCalendarWizard.cfm?d=#FORM.xDate#&amp;rc=#iX#">
