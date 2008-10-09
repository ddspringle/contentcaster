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
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get content data --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#' ORDER BY contentId
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Content List">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="4" height="1"/></td>
    <td  bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="667">
        <tr>
          <td colspan="3"><img src="../images/contentListBoxTitle.gif" alt="Content List" width="673" height="55" /></td>
        <tr>
          <td background="../images/newUserBox_left.gif" width="6"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="667"><table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
              <tr>
                <td width="40" style="padding-left:15px;">ContentId</td>
                <td width="200" >Content</td>
                <td width="80" >Added On </td>
                <td width="50" >Total Views </td>
                <td width="19">&nbsp;</td>
              </tr>
              <cfset rC = 0>
              <cfloop query="qGetContent">
                <!--- the following code simply flip-flops a flag from 0 to 1 and back --->
                <!--- depending on the current state of the flag (1 or 0) determines --->
                <!--- the color used for the background of the row --->
                <!--- if the current state of the flag is 0 --->
                <cfif rC EQ 0>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "94bbfd">
                  <!--- set the state of the flag to 1 (for next pass) --->
                  <cfset rC = 1>
                  <!--- otherwise... --->
                  <cfelse>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "b9bafc">
                  <!--- set the state of the flag to 0 (for next pass) --->
                  <cfset rC = 0>
                  <!--- fin --->
                </cfif>
                <!--- wrap the table row in a cfoutput and use the rowC variable to set --->
                <!--- the background color --->
                <cfoutput>
                  <tr style="background-color:###rowC#">
                    <td width="40" style="padding-left:40px;">#qGetContent.contentId#</td>
                    <td width="200" align="left" valign="middle"><cfinvoke component="getMime" method="getMime" returnvariable="qGetMime" filename="#qGetContent.filename#">
                      <!--- get filename --->
                      <cfset startAt = Find('___',qGetContent.filename)>
                      <cfset passFilename = Right(qGetContent.filename,len(qGetContent.filename)-startAt-2)>
                      <!--- !! HERE !! HERE !! HERE !! HERE !! --->
                      <!--- content = binary non-identified --->
                      <cfif qGetMime.contentType EQ 0 OR qGetMime.contentType EQ 3 OR qGetMime.contentType EQ 4 OR qGetMime.contentType EQ 6 OR qGetMime.contentType EQ 7 OR qGetMime.contentType EQ 8 OR qGetMime.contentType EQ 9>
                        <!--- set standard file link --->
                        <!--- ensure icon file exists --->
                        <cfif FileExists(ExpandPath('../images/icons/#qGetMime.fileExt#.png'))>
                        <!--- it does, display with filetype icon --->
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../images/icons/#qGetMime.fileExt#.png" width="16" alt="#passFilename#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                          <cfelse>
                          <!--- it doesn't, display with standard icon --->
                          
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../images/icons/file.png" width="16" alt="#passFilename#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                        </cfif>
                        <!--- content = image --->
                        <cfelseif qGetMime.contentType EQ 1>
                        <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#" width="#imageWidth#" alt="#qGetContent.filename#" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                        <!--- content = video --->
                        <cfelseif qGetMime.contentType EQ 2>
                        
                        <cfoutput>
                      <script src="/js/AC_RunActiveContent.js" type="text/javascript"></script>
                      <script type="text/javascript">
AC_FL_RunContent( 'type','application/x-shockwave-flash','width','#videoWidth#','height','#videoHeight#','wmode','transparent','data','/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#','movie','/members/flvplayer?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#' ); //end AC code
</script>
                      <noscript>
                      <object type="application/x-shockwave-flash" width="#videoWidth#" height="#videoHeight#" wmode="transparent" data="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#">
                        <param name="movie" value="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#" />
                        <param name="wmode" value="transparent" />
                      </object>
                      </noscript>
                    <br />

                        <!--- ensure icon file exists --->
                        <cfif FileExists(ExpandPath('../images/icons/#qGetMime.fileExt#.png'))>
                        <!--- it does, display with filetype icon --->
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../images/icons/#qGetMime.fileExt#.png" width="16" alt="#passFilename#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                          <cfelse>
                          <!--- it doesn't, display with standard icon --->
                          
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../images/icons/file.png" width="16" alt="#passFilename#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                        </cfif>
                        </cfoutput>
                        <!--- 3, 4 --->
                        <!--- content = audio --->
                        <cfelseif qGetMime.contentType EQ 5>
                         <cfoutput>
                      <script src="/js/AC_RunActiveContent.js" type="text/javascript"></script>
                      <script type="text/javascript">
AC_FL_RunContent( 'type','application/x-shockwave-flash','width','#videoWidth#','height','#videoHeight#','wmode','transparent','data','/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#&showeq=#showEq#','movie','/members/flvplayer?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#&showeq=#showEq#' ); //end AC code
</script>
                      <noscript>
                      <object type="application/x-shockwave-flash" width="#videoWidth#" height="#videoHeight#" wmode="transparent" data="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#&showeq=#showEq#">
                        <param name="movie" value="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#&showeq=#showEq#" />
                        <param name="wmode" value="transparent" />
                      </object>
                      </noscript>
                    <br />

                        <!--- ensure icon file exists --->
                        <cfif FileExists(ExpandPath('../images/icons/#qGetMime.fileExt#.png'))>
                        <!--- it does, display with filetype icon --->
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../images/icons/#qGetMime.fileExt#.png" width="16" alt="#passFilename#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                          <cfelse>
                          <!--- it doesn't, display with standard icon --->
                          
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#"><img src="../images/icons/file.png" width="16" alt="#passFilename#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&contentId=#qGetContent.contentId#&nl=#RandRange(1,9999999)#">#passFilename#</a>
                        </cfif>
                        </cfoutput>
                        <!--- NEXT NEXT NEXT --->
                      </cfif>
                    </td>
                    <td width="80">#DateFormat(qGetContent.addDate,'mm/dd/yy')#</td>
                    <td width="50" align="center">#qGetContent.totalViews#</td>
                    <td width="19" align="center"><a href="dropContent.cfm?z=#URL.z#&amp;s=#Encrypt(Encrypt(qGetContent.contentId,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/deleteIcon.gif" border="0" /></a></td>
                  </tr>
                </cfoutput>
              </cfloop>
            </table>
            <cfoutput><a href="uploadContent.cfm?z=#URL.z#" style="padding-left: 20px;"><img src="../images/uploadContentActionButton.gif" border="0" /></a></cfoutput> </td>
          <td background="../images/newUserBox_right.gif" width="3"><img src="../images/newUserBox_right.gif" width="6" height="1" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" width="673" height="35" /></td>
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
