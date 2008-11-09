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
<cfcomponent>
<cffunction name="getMime" access="public" returntype="query">
  <cfargument name="filename" type="string" required="yes">
  <cfinclude template="../Application.cfm">
  <cfquery name="qGetLength" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
                    SELECT MAX(extLen) AS maxLength FROM a_mimetypes 
                    </cfquery>
  <cfset extStart = Find('.',ARGUMENTS.filename,(len(ARGUMENTS.filename))-(qGetLength.maxLength+2))>
  <cfset ext = Right(ARGUMENTS.filename,len(ARGUMENTS.filename)-extStart)>
  <cfquery name="qFindMime" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
                    SELECT * FROM a_mimetypes WHERE fileExt = '#ext#'
                    </cfquery>
  <cfif qFindMime.RecordCount EQ 0>
  <cfset qFindMime.contentType = 0>
  <cfset qFindMime.mimeType = "text/plain">
  </cfif>
  <cfreturn qFindMime>
</cffunction>
</cfcomponent>
