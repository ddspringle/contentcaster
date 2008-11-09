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
<cfparam name="URL.z" default="">
<!--- contentId, addDate, totalViews --->
<cfparam name="URL.sort" default="contentId">
<!--- check for existence of 'z' --->
<cfif URL.z EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get content data --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#' ORDER BY #URL.sort#
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Content List">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="contentListBoxTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="listTable"><table border="0" cellspacing="0" cellpadding="2" class="listTable">
              <tr>
                <td class="planningTableTitle" colspan="5"><cfoutput>#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
              </tr>
              <cfoutput>
                <tr>
                  <th width="40" class="contentListTitleCenter"><a href="#CGI.SCRIPT_NAME#?z=#URL.z#&amp;sort=contentId" class="contentListTitleCenter">Id</a></th>
                  <th width="434" class="contentListTitle">Content</th>
                  <th width="80" class="contentListTitleCenter"><a href="#CGI.SCRIPT_NAME#?z=#URL.z#&amp;sort=addDate" class="contentListTitleCenter">Added On</a></th>
                  <th width="80" class="contentListTitleCenter"><a href="#CGI.SCRIPT_NAME#?z=#URL.z#&amp;sort=totalViews" class="contentListTitleCenter">Total Views</a></th>
                  <th width="18" class="contentListTitleCenter">&nbsp;</th>
                </tr>
              </cfoutput>
              <cfset rC = 0>
              <cfloop query="qGetContent">
                <!--- the following code simply flip-flops a flag from 0 to 1 and back --->
                <!--- depending on the current state of the flag (1 or 0) determines --->
                <!--- the color used for the background of the row --->
                <!--- if the current state of the flag is 0 --->
                <cfif rC EQ 0>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = firstRow>
                  <!--- set the state of the flag to 1 (for next pass) --->
                  <cfset rC = 1>
                  <!--- otherwise... --->
                  <cfelse>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = secRow>
                  <!--- set the state of the flag to 0 (for next pass) --->
                  <cfset rC = 0>
                  <!--- fin --->
                </cfif>
                <!--- wrap the table row in a cfoutput and use the rowC variable to set --->
                <!--- the background color --->
                <cfoutput>
                  <tr style="background-color:###rowC#;">
                    <td width="40" class="contentListCenter">#qGetContent.contentId#</td>
                    <td width="434" class="contentList"><!--- get mimeType of content --->
                      <cfinvoke component="/components/getMime" method="getMime" returnvariable="qGetMime" filename="#qGetContent.filename#">
                      <!--- !! HERE !! HERE !! HERE !! HERE !! --->
                      <!--- content = binary non-identified --->
                      <cfif qGetMime.contentType EQ 0 OR qGetMime.contentType EQ 3 OR qGetMime.contentType EQ 4 OR qGetMime.contentType EQ 6 OR qGetMime.contentType EQ 7 OR qGetMime.contentType EQ 8 OR qGetMime.contentType EQ 9>
                        <!--- set standard file link --->
                        <!--- ensure icon file exists --->
                        <cfif FileExists(ExpandPath('../images/icons/#qGetMime.fileExt#.png'))>
                          <!--- it does, display with filetype icon --->
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../images/icons/#qGetMime.fileExt#.png" width="16" alt="#qGetContent.contentName#" border="0" align="middle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
                          <cfelse>
                          <!--- it doesn't, display with standard icon --->
                          <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../images/icons/file.png" width="16" alt="#qGetContent.contentName#" border="0" align="middle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
                        </cfif>
                        <!--- content = image --->
                        <cfelseif qGetMime.contentType EQ 1>
                        <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#" width="#imageWidth#" alt="#qGetContent.filename#" align="middle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
                        <!--- content = video --->
                        <cfelseif qGetMime.contentType EQ 2>
                        <cfoutput>
                          <script src="/js/AC_RunActiveContent.js" type="text/javascript"></script>
                          <script type="text/javascript">
AC_FL_RunContent( 'type','application/x-shockwave-flash','width','#videoWidth#','height','#videoHeight#','wmode','transparent','data','/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#','movie','/members/flvplayer?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&autostart=#autostart#&showvolume=#showVolume#&showdigits=#showDigits#&bufferlength=#bufferLength#' ); //end AC code
</script>
                          <noscript>
                          <object type="application/x-shockwave-flash" width="#videoWidth#" height="#videoHeight#" wmode="transparent" data="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&amp;autostart=#autostart#&amp;showvolume=#showVolume#&amp;showdigits=#showDigits#&amp;bufferlength=#bufferLength#">
                            <param name="movie" value="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&amp;autostart=#autostart#&amp;showvolume=#showVolume#&amp;showdigits=#showDigits#&amp;bufferlength=#bufferLength#" />
                            <param name="wmode" value="transparent" />
                          </object>
                          </noscript>
                          <br />
                          <!--- ensure icon file exists --->
                          <cfif FileExists(ExpandPath('../images/icons/#qGetMime.fileExt#.png'))>
                            <!--- it does, display with filetype icon --->
                            <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../images/icons/#qGetMime.fileExt#.png" width="16" alt="#qGetContent.contentName#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
                            <cfelse>
                            <!--- it doesn't, display with standard icon --->
                            <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../images/icons/file.png" width="16" alt="#qGetContent.contentName#" border="0" align="absmiddle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
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
                          <object type="application/x-shockwave-flash" width="#videoWidth#" height="#videoHeight#" wmode="transparent" data="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&amp;autostart=#autostart#&amp;showvolume=#showVolume#&amp;showdigits=#showDigits#&amp;bufferlength=#bufferLength#&amp;showeq=#showEq#">
                            <param name="movie" value="/members/flvplayer.swf?file=#contentUrl##qGetCat.categoryId#/#qGetContent.filename#&amp;autostart=#autostart#&amp;showvolume=#showVolume#&amp;showdigits=#showDigits#&amp;bufferlength=#bufferLength#&amp;showeq=#showEq#" />
                            <param name="wmode" value="transparent" />
                          </object>
                          </noscript>
                          <br />
                          <!--- ensure icon file exists --->
                          <cfif FileExists(ExpandPath('../images/icons/#qGetMime.fileExt#.png'))>
                            <!--- it does, display with filetype icon --->
                            <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../images/icons/#qGetMime.fileExt#.png" width="16" alt="#qGetContent.contentName#" border="0" align="middle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
                            <cfelse>
                            <!--- it doesn't, display with standard icon --->
                            <a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#"><img src="../images/icons/file.png" width="16" alt="#qGetContent.contentName#" border="0" align="middle" /></a>&nbsp;&nbsp;<a href="../contentCaster.cfm?categoryId=#qGetCat.categoryId#&amp;contentId=#qGetContent.contentId#&amp;nl=#RandRange(1,9999999)#">#qGetContent.contentName#</a>
                          </cfif>
                        </cfoutput>
                        <!--- NEXT NEXT NEXT --->
                      </cfif>
                    </td>
                    <td width="80" class="contentListCenter">#DateFormat(qGetContent.addDate,'mm/dd/yy')#</td>
                    <td width="80" class="contentListCenter">#qGetContent.totalViews#</td>
                    <td width="18" class="contentListCenter"><a href="dropContent.cfm?z=#URL.z#&amp;s=#Encrypt(Encrypt(qGetContent.contentId,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/cancel.png" border="0" alt="Delete Content" /></a></td>
                  </tr>
                </cfoutput>
              </cfloop>
              <tr>
                <td colspan="5" class="listTable">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="5" class="listTable"><cfoutput><a href="uploadContent.cfm?z=#URL.z#" style="padding-left: 20px;"><img src="../images/uploadContentActionButton.gif" border="0" alt="Upload Content" /></a></cfoutput> </td>
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
    <td class="navStyle"><cfoutput><a href="planCategory.cfm?z=#URL.z#"><img src="../images/plannerButton.gif" alt="Plan Category" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
