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
  <cfset level = "user">
  <cfelse>
  <cfset level = "admin">
</cfif>
<cfif auth[1] EQ "invalid" OR auth[1] EQ "timeout">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- set params --->
<cfparam name="FORM.ucid" default="">
<cfparam name="FORM.sbdStartDate" default="">
<cfparam name="FORM.sbdEndDate" default="">
<cfparam name="FORM.sbdStartSeq" default="1">
<cfparam name="FORM.sbsStartSeq" default="1">
<cfparam name="FORM.sbsEndSeq" default="-1">
<cfparam name="FORM.sbsStartDate" default="">
<cfparam name="FORM.rotStartDate" default="">
<cfparam name="FORM.rotEndDate" default="">
<cfparam name="FORM.rotStartSeq" default="1">
<cfparam name="FORM.rotEndSeq" default="-1">
<cfparam name="FORM.Submit" default="">
<!--- check for existence of 'ucid' --->
<cfif FORM.ucid EQ "" OR FORM.Submit EQ "">
  <cfoutput>USID</cfoutput>
  <cfabort>
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newUsid = Decrypt(Decrypt(FORM.ucid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newUsid#'
</cfquery>
<!--- get content data for category --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_contentbase WHERE ucid = '#newUsid#' ORDER BY contentId
</cfquery>
<!--- determine which Submit button was pressed --->
<!---                 --->
<!--- SHEDULE BY DATE --->
<!---                 --->
<cfif FORM.Submit EQ "Schedule By Date">
  <!--- ensure proper start and end dates and start content --->
  <cfif FORM.sbdStartDate EQ "" OR FORM.sbdEndDate EQ "" OR FORM.sbdStartSeq EQ "">
    <!--- if missing information, redirect --->
    <cfoutput>STR:#FORM.sbdStartDate#| END:#FORM.sbdEndDate#| SEQ:#FORM.sbdStartSeq#</cfoutput>
    <cfabort>
    <cflocation url="listCategories.cfm?err=1">
    <!--- fin --->
  </cfif>
  <!--- ensure not past end of month on end date --->
  <cftry>
    <cfif DateFormat(FORM.sbdEndDate,'dd') GT DaysInMonth(CreateDate(DateFormat(FORM.sbdEndDate,'yyyy'),DateFormat(FORM.sbdEndDate,'mm'),1))>
      <cfset FORM.sbdEndDate = CreateDate(DateFormat(FORM.sbdEndDate,'yyyy'),DateFormat(FORM.sbdEndDate,'mm'),DaysInMonth(CreateDate(DateFormat(FORM.sbdEndDate,'yyyy'),DateFormat(FORM.sbdEndDate,'mm'),1)))>
    </cfif>
    <cfcatch type="any">
      <cflocation url="scheduleWizard.cfm?err=99&amp;z=#FORM.ucid#">
    </cfcatch>
  </cftry>
  <!--- delete all contents between the start and end dates --->
  <cfquery name="qDelSeq" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  DELETE FROM a_categoryschedule WHERE ucid = '#newUsid#' AND runDate >= '#DateFormat(FORM.sbdStartDate,'yyyy-mm-dd')#' AND runDate <= '#DateFormat(FORM.sbdEndDate,'yyyy-mm-dd')#'
  </cfquery>
  <!--- initialize contentNum --->
  <cfset contentNum = FORM.sbdStartSeq>
  <!--- initialize a counter --->
  <cfset iZ = 0>
  <!--- loop through all days selected (from start to end date) --->
  <cfloop from="0" to="#DateDiff('d',FORM.sbdStartDate,FORM.sbdEndDate)#" index="iX">
    <!--- check if contentNum is higher than total returned records minus start content --->
    <cfif contentNum GT (qGetContent.RecordCount - FORM.sbdStartSeq)>
      <!--- set iZ back to start --->
      <cfset iZ = 0>
      <!--- fin --->
    </cfif>
    <!--- set contentNum --->
    <cfset contentNum = FORM.sbdStartSeq + iZ>
    <!--- add one to iZ counter --->
    <cfset iZ = iZ + 1>
    <!--- insert todays content into the database --->
    <cfquery name="qPutSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
    INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newUsid#', '#contentNum#', '#DateFormat(DateAdd('d',iX,FORM.sbdStartDate),'yyyy-mm-dd')#')
    </cfquery>
    <cfoutput>INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newUsid#', '#contentNum#', '#DateFormat(DateAdd('d',iX,FORM.sbdStartDate),'yyyy-mm-dd')#')<br />
      <br />
    </cfoutput>
    <cfflush>
    <!--- cycle back or end --->
  </cfloop>
  <!--- set start date --->
  <cfset startDate = FORM.sbdStartDate>
  <!---                      --->
  <!--- SCHEDULE BY SEQUENCE --->
  <!---                      --->
  <cfelseif FORM.Submit EQ "Schedule By Content">
  <!--- ensure proper start and end dates and start content --->
  <cfif FORM.sbsStartDate EQ "" OR FORM.sbsStartSeq EQ "" OR FORM.sbsEndSeq EQ "">
    <!--- if missing information, redirect --->
    <cfoutput>DTE:#FORM.sbsStartDate#| END:#FORM.sbsEndSeq#| STR:#FORM.sbsStartSeq#</cfoutput>
    <cfabort>
    <cflocation url="listCategories.cfm?err=1">
    <!--- fin --->
  </cfif>
  <!--- ensure not past end of month on end date --->
  <cftry>
    <cfif DateFormat(FORM.sbsEndDate,'dd') GT DaysInMonth(CreateDate(DateFormat(FORM.sbsEndDate,'yyyy'),DateFormat(FORM.sbsEndDate,'mm'),1))>
      <cfset FORM.sbsEndDate = CreateDate(DateFormat(FORM.sbsEndDate,'yyyy'),DateFormat(FORM.sbsEndDate,'mm'),DaysInMonth(CreateDate(DateFormat(FORM.sbsEndDate,'yyyy'),DateFormat(FORM.sbsEndDate,'mm'),1)))>
    </cfif>
    <cfcatch type="any">
      <cflocation url="scheduleWizard.cfm?err=99&amp;z=#FORM.ucid#">
    </cfcatch>
  </cftry>
  <!--- delete all contents between the start and end dates --->
  <cfquery name="qDelSeq" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  DELETE FROM a_categoryschedule WHERE ucid = '#newUsid#' AND runDate >= '#DateFormat(FORM.sbsStartDate,'yyyy-mm-dd')#' AND runDate <= '#DateFormat(FORM.sbsEndDate,'yyyy-mm-dd')#'
  </cfquery>
  <!--- initialize a counter --->
  <cfset iZ = 0>
  <!--- loop through each content --->
  <cfloop from="#FORM.sbsStartSeq#" to="#FORM.sbsEndSeq#" index="iX">
    <!--- insert todays content into the database --->
    <cfquery name="qPutSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
    INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newUsid#', '#iX#', '#DateFormat(DateAdd('d',iZ,FORM.sbsStartDate),'yyyy-mm-dd')#')
    </cfquery>
    <cfoutput>INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newUsid#', '#iX#', '#DateFormat(DateAdd('d',iZ,FORM.sbsStartDate),'yyyy-mm-dd')#')<br />
      <br />
    </cfoutput>
    <cfflush>
    <!--- add one to the counter --->
    <cfset iZ = iZ + 1>
    <!--- cycle back or end --->
  </cfloop>
  <!--- set start date --->
  <cfset startDate = FORM.sbsStartDate>
  <!---                    --->
  <!--- Configure Rotation --->
  <!---                    --->
  <cfelseif FORM.Submit EQ "Configure Rotation">
  <!--- ensure proper start and end dates and start content --->
  <cfif FORM.rotStartDate EQ "" OR FORM.rotEndDate EQ "" OR FORM.rotStartSeq EQ "" OR FORM.rotEndSeq EQ "">
    <!--- if missing information, redirect --->
    <cfoutput>STR:#FORM.rotStartDate#| END:#FORM.rotEndDate#| SSQ:#FORM.rotStartSeq#| ESQ:#FORM.rotEndSeq#</cfoutput>
    <cfabort>
    <cflocation url="listCategories.cfm?err=1">
    <!--- fin --->
  </cfif>
  <!--- ensure not past end of month on end date --->
  <cftry>
    <cfif DateFormat(FORM.rotEndDate,'dd') GT DaysInMonth(CreateDate(DateFormat(FORM.rotEndDate,'yyyy'),DateFormat(FORM.rotEndDate,'mm'),1))>
      <cfset FORM.rotEndDate = CreateDate(DateFormat(FORM.rotEndDate,'yyyy'),DateFormat(FORM.rotEndDate,'mm'),DaysInMonth(CreateDate(DateFormat(FORM.rotEndDate,'yyyy'),DateFormat(FORM.rotEndDate,'mm'),1)))>
    </cfif>
    <cfcatch type="any">
      <cflocation url="scheduleWizard.cfm?err=99&amp;z=#FORM.ucid#">
    </cfcatch>
  </cftry>
  <!--- delete all contents between the start and end dates --->
  <cfquery name="qDelSeq" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  DELETE FROM a_categoryschedule WHERE ucid = '#newUsid#' AND runDate >= '#DateFormat(FORM.rotStartDate,'yyyy-mm-dd')#' AND runDate <= '#DateFormat(FORM.rotEndDate,'yyyy-mm-dd')#'
  </cfquery>
  <!--- initialize contentNum --->
  <cfset contentNum = FORM.rotStartSeq>
  <!--- initialize a counter --->
  <cfset iZ = 0>
  <!--- loop through all days selected (from start to end date) --->
  <cfloop from="0" to="#DateDiff('d',FORM.rotStartDate,FORM.rotEndDate)#" index="iX">
    <!--- check if contentNum is higher than total returned records minus start content --->
    <cfif contentNum GT (FORM.rotEndSeq - FORM.rotStartSeq)>
      <!--- set iZ back to start --->
      <cfset iZ = 0>
      <!--- fin --->
    </cfif>
    <!--- set contentNum --->
    <cfset contentNum = FORM.rotStartSeq + iZ>
    <!--- add one to iZ counter --->
    <cfset iZ = iZ + 1>
    <!--- insert todays content into the database --->
    <cfquery name="qPutSched" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
    INSERT INTO a_categoryschedule (uschedid, ucid, contentId, runDate) VALUES ('#CreateUUID()#', '#newUsid#', '#contentNum#', '#DateFormat(DateAdd('d',iX,FORM.rotStartDate),'yyyy-mm-dd')#')
    </cfquery>
    <!--- cycle back or end --->
  </cfloop>
  <!--- set start date --->
  <cfset startDate = FORM.rotStartDate>
  <cfelse>
</cfif>
<!--- redirect to calendar --->
<cflocation url="calendarWizard.cfm?z=#FORM.ucid#&amp;d=#DateFormat(startDate,'yyyy-mm-01')#">
