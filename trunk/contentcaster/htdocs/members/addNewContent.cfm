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
<cfset errorText = "">
<!--- check for existence of 'z' --->
<cfif FORM.ucid EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(FORM.ucid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get contents for category --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#'
</cfquery>
<!--- set form params and check each iteration for potential uploads --->
<cfloop from="1" to="10" index="iX">
  <cfparam name="FORM['contentFile' & iX]" default="">
  <!--- check if there was data in the form --->
  <cfif FORM['contentFile' & iX] NEQ "">
    <!--- upload the file --->
    <cftry>
      <cffile action="upload" filefield="contentFile#iX#" destination="#contentPath##qGetCat.categoryId#/" result="fileUploaded" nameconflict="makeunique">
      <cfcatch type="any">
        <cfoutput>#cfcatch.Message#</cfoutput>
        <cfabort>
      </cfcatch>
    </cftry>
    <!--- try to get the last id from the database --->
    <cftry>
      <cfquery name="qGetId" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
	  SELECT MAX(contentId) as id FROM a_contentbase
      </cfquery>
      <!--- catch any errors --->
      <cfcatch type="any">
        <!--- spit out an error message --->
        <cfoutput>#cfcatch.Message#</cfoutput>
        <cfabort>
      </cfcatch>
    </cftry>
    <!--- generate random text with upper and lowercase characters, length of 6 characters (change passLength to modify) --->
    <cfinvoke component="/components/randomPassword" method="randomPassword" returnvariable="randomText" useLower=1 useUpper=1 useNumeric=0 useSpecial=0 passLength=3>
    <!--- set new image name using contentPrefix, randomText and last 4 chars (presumably .gif, .jpg, etc.) of the original filename --->
    <cfset newContentName = (qGetId.id+1) & '-' & contentPrefix & randomText & '___' & fileUploaded.serverFile>
    <!--- get mime data --->
    <cfinvoke component="/components/getMime" method="getMime" returnvariable="qGetMime" filename="#fileUploaded.serverFile#">
    <!--- determine if file is binary or not --->
    <cfif Find('text',qGetMime.mimeType)>
      <!--- mimeType contains 'text' - likely not a binary file --->
      <cfset binFile = 0>
      <cfelse>
      <!--- otherwise, likely a binary file --->
      <cfset binFile = 1>
    </cfif>
    <!--- set-up error checking to catch duplicate name --->
    <cftry>
      <!--- rename (move) the file to use the new image name (newContentName) --->
      <cffile action="move" source="#contentPath##qGetCat.categoryId#/#fileUploaded.serverFile#" destination="#contentPath##qGetCat.categoryId#/#newContentName#">
      <!--- catch any errors --->
      <cfcatch type="any">
        <!--- spit out an error message --->
        <cfoutput>#cfcatch.Message#</cfoutput>
        <cfabort>
      </cfcatch>
    </cftry>
    <!--- add new content to the database --->
    <cfquery name="qPutContent" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
INSERT INTO a_contentbase (contentId, contentName, ucid, filename, addDate, totalViews, urecid, mimeType, isBinaryFile) VALUES ('#qGetId.id+1#', '#fileUploaded.serverFile#', '#newZ#', '#newContentName#', '#DateFormat(Now(),'yyyy-mm-dd')#', 0, '#CreateUUID()#', '#qGetMime.mimeType#', '#binFile#')
    </cfquery>
  </cfif>
</cfloop>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Added Content">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="addContentSuccessTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="successTable"><table border="0" cellspacing="0" cellpadding="2" class="textTable">
              <tr>
                <td><cfoutput>Your content has been successfully added to the database and uploaded to the #Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')# directory.</cfoutput></td>
              </tr>
            </table></td>
          <td class="newUserRight">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" class="newUserFooter">&nbsp;</td>
        </tr>
      </table></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td class="navStyle"><cfoutput><a href="listContent.cfm?z=#FORM.ucid#"><img src="../images/manageContentButtonGray.gif" alt="Manage Content" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0"/></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
