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
<cfparam name="FORM.ucid" default="">
<cfset errorText = "">
<!--- check for existence of 'z' --->
<cfif FORM.ucid EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(FORM.ucid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get contents for category --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#'
</cfquery>
<!--- set form params and check each iteration for potential uploads --->
<cfloop from="1" to="10" index="iX">
  <cfparam name="FORM['contentFile' &amp; iX]" default="">
  <cfparam name="FORM['contentNum' &amp; iX]" default="">
  <!--- check if there was data in the form --->
  <cfif FORM['contentFile' & iX] NEQ "">
    <cfquery name="qGetContentId" dbtype="query">
  SELECT * FROM qGetContent WHERE contentId = #FORM['contentNum' & iX]#
  </cfquery>
    <cfif qGetContentId.RecordCount EQ 0>
      <!--- upload the file --->
      <cftry>
        <cffile action="upload" filefield="contentFile#iX#" destination="#contentPath##qGetCat.categoryId#/" result="fileUploaded" nameconflict="makeunique">
        <cfcatch type="any">
          <cfoutput>#cfcatch.Message#</cfoutput>
          <cfabort>
        </cfcatch>
      </cftry>
      <!--- generate random text with upper and lowercase characters, length of 6 characters (change passLength to modify) --->
      <cfinvoke component="randomPassword" method="randomPassword" returnvariable="randomText" useLower=1 useUpper=1 useNumeric=0 useSpecial=0 passLength=3>
      <!--- set new image name using contentPrefix, randomText and last 4 chars (presumably .gif, .jpg, etc.) of the original filename --->
      <cfset newContentName = FORM['contentNum' & iX] & '-' & contentPrefix & randomText & '___' & fileUploaded.serverFile>
      <!--- get mime data --->
      <cfinvoke component="getMime" method="getMime" returnvariable="qGetMime" filename="#fileUploaded.serverFile#">
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
        </cfcatch>
      </cftry>
      <!--- add new image to the database --->
      <cfquery name="qPutContent" datasource="#ds#" username="#un#" password="#pw#">
INSERT INTO a_contentbase (contentId, ucid, filename, addDate, totalViews, urecid, mimeType, isBinaryFile) VALUES ('#FORM['contentNum'     & iX]#', '#newZ#', '#newContentName#', '#DateFormat(Now(),'yyyy-mm-dd')#', 0, '#CreateUUID()#', '#qGetMime.mimeType#', '#binFile#')
    </cfquery>
      <cfelse>
      <cfset errorText = errorText & "Content number #FORM['contentNum' & iX]# already exists in the database and was not modified.<br />">
    </cfif>
  </cfif>
</cfloop>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Added Content">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<!--- check if errorText has value --->
<!--- it has value, display errors --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
      <tr>
        <td colspan="3"><img src="../images/addContentSuccessBoxTitle.gif" alt="Content Added" width="673" height="54" /></td>
      </tr>
      <tr>
      <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
      <td class="textTable" width="655">
      <table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
        <tr>
          <td><cfif errorText NEQ "">
              <cfoutput>
                <p style="margin-left: 30px;">#errorText#</p>
              </cfoutput>
              <p style="margin-left: 30px;"> If you would like to upload content in place of this content, please drop this content from the database before uploading new content in its place. Thank you. </p>
              <cfelse>
              <p style="margin-left: 30px;"> Your content has been successfully added to the database and uploaded to your category directory. </p>
            </cfif></td>
        </tr>
      </table>
      <cfoutput> <a href="uploadContent.cfm?z=#FORM.ucid#" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: ##000000; text-decoration:none;"><img src="../images/uploadContentActionButton.gif" alt="Upload Content" width="157" height="47" border="0" /></a>
        </td>
        <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
        </table>
        <br />
        <a href="listContent.cfm?z=#FORM.ucid#" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: ##000000; text-decoration:none;"><img src="../images/manageContentButtonGray.gif" alt="Manage Content" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0"/></a><a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
