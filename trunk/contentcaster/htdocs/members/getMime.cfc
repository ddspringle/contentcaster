<cfcomponent>
<cffunction name="getMime" access="public" returntype="query">
  <cfargument name="filename" type="string" required="yes">
  <cfinclude template="../Application.cfm">
  <cfquery name="qGetLength" datasource="#ds#" username="#un#" password="#pw#">
                    SELECT MAX(extLen) AS maxLength FROM a_mimetypes 
                    </cfquery>
  <cfset extStart = Find('.',ARGUMENTS.filename,(len(ARGUMENTS.filename))-(qGetLength.maxLength+2))>
  <cfset ext = Right(ARGUMENTS.filename,len(ARGUMENTS.filename)-extStart)>
  <cfquery name="qFindMime" datasource="#ds#" username="#un#" password="#pw#">
                    SELECT * FROM a_mimetypes WHERE fileExt = '#ext#'
                    </cfquery>
  <cfif qFindMime.RecordCount EQ 0>
  <cfset qFindMime.contentType = 0>
  <cfset qFindMime.mimeType = "text/plain">
  </cfif>
  <cfreturn qFindMime>
</cffunction>
</cfcomponent>
