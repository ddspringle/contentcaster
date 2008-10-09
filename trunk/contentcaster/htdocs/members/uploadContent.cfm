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
<cfparam name="URL.z" default="">
<!--- check for existence of 'z' --->
<cfif URL.z EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get number of contents --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#'
</cfquery>
<!--- add '1' to whatever the value is --->
<cfset qGetContent.RecordCount = qGetContent.RecordCount + 1>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Upload Contents">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td  bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="667">
        <tr>
          <td colspan="3"><img src="../images/uploadContentTitle.gif" alt="Upload Content" width="673" height="54" /></td>
        <tr>
          <td background="../images/newUserBox_left.gif" width="6"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="667"> Use the following form to browse for and upload up to ten content files at once. For each content file, you must specify the content number of the content selected for upload in that row. NOTE: It is possible to assign more than one content the same content number - this will overwrite the previous content that was uploaded and will generally cause problems displaying the category, so ensure you're choosing unique content numbers for each content you upload to avoid this!<br />
            <br />
            <form action="addNewContent.cfm" method="post" enctype="multipart/form-data" name="uploadForm" id="uploadForm" style="padding-left: 30px;">
              <cfoutput>
                <input type="hidden" name="ucid" value="#URL.z#" />
              </cfoutput>
              <cfloop from="1" to="10" index="lI">
                <cfoutput>
                  <input type="file" name="contentFile#lI#" id="contentFile#lI#" border="1" size="50"/>
                  <select name="contentNum#lI#" style="border: 1px solid ##000000;">
                </cfoutput>
                <cfloop from="#qGetContent.RecordCount#" to="#maxContent#" index="seq">
                  <cfoutput>
                    <option value="#seq#" <cfif (seq-qGetContent.RecordCount) EQ lI>selected="selected"</cfif>>#seq#</option>
                  </cfoutput>
                </cfloop>
                </select>
                <br />
                <br />
              </cfloop>
              <p>
                <input type="image" src="../images/addButton.gif" name="Submit" id="Submit" value="Upload" />
              </p>
            </form></td>
          <td background="../images/newUserBox_right.gif" width="3"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br>
      <cfoutput><a href="planCategory.cfm?z=#URL.z#" style="padding-left:40px;"><img src="../images/plannerButton.gif" alt="Plan Category" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm" style="padding-left: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a><br />
    </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
