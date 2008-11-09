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
<cftry>
<!--- set params --->
<cfparam name="URL.categoryId" default="">
<cfparam name="URL.contentId" default="">
<cfparam name="URL.runDate" default="">
<cfparam name="URL.runHour" default="0">
<cfparam name="URL.nl" default="0">
<!--- check for no params (default scehdule) --->
<cfif URL.categoryId EQ "">
  <!--- clear initial record count --->
  <cfset qGetDefSchedule.RecordCount = 0>
  <!--- initialize counter --->
  <cfset cn = 0>
  <!--- begin loop to search for today's (or previous day(s)) image --->
  <cfloop condition="qGetDefSchedule.RecordCount LTE 0">
    <!--- query database for image, using the counter to count backwards cn number of days --->
    <cfquery name="qGetDefSchedule" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_defaultcategoryschedule WHERE runDate = '#DateFormat(DateAdd('d',-cn,Now()), 'yyyy-mm-dd')#'
    </cfquery>
    <!--- add one to the counter --->
    <cfset cn = cn + 1>
    <!--- loop back if condition not met (an image has not been found) --->
  </cfloop>
  <cfquery name="qGetSchedule" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categoryschedule WHERE (runDate BETWEEN #CreateDateTime(Year(qGetDefSchedule.runDate), Month(qGetDefSchedule.runDate), Day(qGetDefSchedule.runDate), Hour(qGetDefSchedule.runDate), 0, 0)# AND #CreateDateTime(Year(qGetDefSchedule.runDate), Month(qGetDefSchedule.runDate), Day(qGetDefSchedule.runDate), Hour(Now()), 59, 59)#) AND ucid = '#qGetDefSchedule.ucid#'
  </cfquery>
  <!--- ensure content is scheduled for this day --->
  <cfif qGetSchedule.RecordCount NEQ 0>
  <!--- set the unique category id --->
  <cfset ucid = qGetSchedule.ucid>
  <!--- set the content id --->
  <cfset contentId = qGetSchedule.contentId>
  <cfelse>
  <cfthrow message="No content has been scheduled for #DateFormat(Now(),'mm/dd/yyyy')# #Lcase(TimeFormat(Now(),'hh:mm:ss tt'))#." type="Content Error">
  </cfif>
  <!--- not using default category schedule --->
  <!--- using category ID --->
  <cfelseif URL.categoryId NEQ "" AND URL.contentId EQ "" AND URL.runDate EQ "">
  <!--- clear initial record count --->
  <cfset qGetSchedule.RecordCount = 0>
  <!--- initialize counter --->
  <cfset cn = 0>
  <!--- get ucid --->
  <cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  SELECT * FROM a_categorybase WHERE categoryId = '#URL.categoryId#'
  </cfquery>
  <cfset ucid = qGetCat.ucid>
  <!--- begin loop to search for today's (or previous day(s)) image --->
  <cfloop condition="qGetSchedule.RecordCount LTE 0">
    <!--- query database for image, using the counter to count backwards cn number of days --->
    <cfquery name="qGetSchedule" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categoryschedule WHERE ucid = '#ucid#' AND (runDate BETWEEN #CreateDateTime(Year(DateAdd('h',-cn,Now())), Month(DateAdd('h',-cn,Now())), Day(DateAdd('h',-cn,Now())), Hour(DateAdd('h',-cn,Now())), 0, 0)# AND #CreateDateTime(Year(DateAdd('h',-cn,Now())), Month(DateAdd('h',-cn,Now())), Day(DateAdd('h',-cn,Now())), Hour(DateAdd('h',-cn,Now())), 59, 59)#)
    </cfquery>
    <!--- add one to the counter --->
    <cfset cn = cn + 1>
    <!--- loop back if condition not met (an image has not been found) --->
  </cfloop>
  <cfset ucid = qGetSchedule.ucid>
  <cfset contentId = qGetSchedule.contentId>
  <!--- using content ID --->
  <cfelseif URL.contentId NEQ "" AND URL.runDate EQ "">
  <cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  SELECT * FROM a_categorybase WHERE categoryId = '#URL.categoryId#'
  </cfquery>
  <cfset ucid = qGetCat.ucid>
  <cfset contentId = URL.contentId>
  <!--- using run date --->
  <cfelseif URL.runDate NEQ "" AND URL.contentId EQ "">
  <cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  SELECT * FROM a_categorybase WHERE categoryId = '#URL.categoryId#'
  </cfquery>
  <cfset ucid = qGetCat.ucid>
  <!--- get the image from the schedule --->
  <cfquery name="qGetSchedule" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categoryschedule WHERE (runDate BETWEEN #CreateDateTime(Year(URL.runDate), Month(URL.runDate), Day(URL.runDate), Hour(URL.runHour), 0, 0)# AND #CreateDateTime(Year(URL.runDate), Month(URL.runDate), Day(URL.runDate), Hour(Now()), 59, 59)#) AND ucid = '#ucid#'
  </cfquery>
  <cfset contentId = qGetSchedule.contentId>
  <cfelse>
  <!--- something has gone terribly wrong (pebkac error) --->
  <cflocation url="#defImgUrl#">
</cfif>
<!--- have record, get content info --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT filename, totalViews, mimeType, isBinaryFile from a_contentbase WHERE ucid = '#ucid#' AND contentId = '#contentId#'
</cfquery>
<!--- ensure logging isn't disabled (for internal viewers) --->
<cfif URL.nl EQ 0>
  <!---  add one to total views for this record --->
  <cfset newViews = qGetContent.totalViews + 1>
  <!--- update the record by adding one (1) to the current total views count --->
  <cfquery name="qUpdViews" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
UPDATE a_contentbase SET totalViews = #newViews# where contentId = '#contentId#'
</cfquery>
  <!--- log this hit in the database --->
  <cfquery name="logHit" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
INSERT INTO a_contentlog (uslid, ucid, contentId, viewHostIP, viewReferer, viewDate) VALUES ('#CreateUUID()#', '#ucid#',  '#contentId#', '#CGI.REMOTE_ADDR#', '#CGI.HTTP_REFERER#', '#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'HH:mm:ss')#')
</cfquery>
</cfif>
<!--- get categoryId --->
<cfquery name="qGetCatId" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT categoryId FROM a_categorybase WHERE ucid = '#ucid#'
</cfquery>
<!--- get filename --->
<cfset startAt = Find('___',qGetContent.filename)>
<cfset passFilename = Right(qGetContent.filename,len(qGetContent.filename)-startAt-2)>
<!--- get mime data --->
<cfinvoke component="/components/getMime" method="getMime" returnvariable="qGetMime" filename="#qGetContent.filename#">
<!--- determine if text --->
<cfset isText = Find('text',qGetContent.mimeType)>
<!--- pass referer --->
<cfheader name="Referer" value="#CGI.HTTP_REFERER#">
<!--- cache control --->
<cfheader name="Cache-control" value="no-store">
<cfheader name="Pragma" value="no-cache">
<cfheader name="Expires" value="0">
<cfheader name="X-Powered-By" value="ContentCaster v#version#">
<!--- check mime content type for attachement or inline disposition --->
<cfif qGetMime.contentType EQ 0 AND isText EQ 0>
  <cfheader name="Content-Disposition" value="attachment; filename=#passFilename#">
  <cfelseif qGetMime.contentType GT 0>
  <cfheader name="Content-Disposition" value="inline; filename=#passFilename#">
</cfif>
<!--- check if content is binary or not --->
<cfif qGetContent.isBinaryFile EQ 1>
  <!--- read binary content --->
  <cffile action="readbinary" file="#contentPath##qGetCatId.categoryId#/#qGetContent.filename#" variable="content">
  <cfelse>
  <!--- read non-binary content --->
  <cffile action="read" file="#contentPath##qGetCatId.categoryId#/#qGetContent.filename#" variable="content">
</cfif>
<!--- check if text --->
<cfif isText GT 0>
  <!--- is text, just output --->
  <cfoutput>
    <pre>#content#</pre>
  </cfoutput>
  <cfelse>
  <!--- deliver file in the right mime type --->
  <cfcontent type="#qGetContent.mimeType#" variable="#content#" reset="yes">
</cfif>
<cfcatch type="any">
<cfdump var="#cfcatch.Type#">:
<cfdump var="#cfcatch.Message#">
</cfcatch>
</cftry>