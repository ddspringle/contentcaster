<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cflocation url="index.cfm?err=5">
</cfif>
<!--- set params --->
<cfparam name="URL.err" default="">
<cfparam name="URL.z" default="">
<cfparam name="URL.month" default="#DateFormat(Now(),'yyyy-mm-dd')#">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into all of the fields and click submit to proceed.">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- check for existence of 'z' --->
<cfif URL.z EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- query the database for this categories logs --->
<cfquery name="qGetLogs" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_contentlog WHERE ucid = '#newZ#'
</cfquery>
<!--- sub-query the previous query to acquire just hits within specific month --->
<cfquery name="qGetHits" dbtype="query" maxrows="#maxLogRows#">
  SELECT * FROM qGetLogs WHERE viewDate >= '#DateFormat(CreateDate(DateFormat(URL.month,'yyyy'),DateFormat(URL.month,'mm'),1),'yyyy-mm-dd')# 00:00:00' AND viewDate <= '#DateFormat(CreateDate(DateFormat(URL.month,'yyyy'),DateFormat(URL.month,'mm'),DaysInMonth(URL.month)),'yyyy-mm-dd')# 23:59:59' ORDER BY viewDate DESC
  </cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Show Category Logs">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/categoryLogViewer.gif" alt="Category Logs" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><table width="618" border="0" cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                      <td><cfoutput><a href="showCategoryLogs.cfm?z=#URL.z#&amp;month=#DateFormat(DateAdd('m',-1,URL.month),'yyyy-mm-dd')#" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10pt; font-weight:bold; color: ##000000;">#DateFormat(DateAdd('m',-1,URL.month),'MMMM')# Views</a></cfoutput></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td><cfoutput><a href="showCategoryLogs.cfm?z=#URL.z#&amp;month=#DateFormat(DateAdd('m',1,URL.month),'yyyy-mm-dd')#" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10pt; font-weight:bold; color: ##000000;">#DateFormat(DateAdd('m',1,URL.month),'MMMM')# Views</a></cfoutput></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td width="156">Total Hits in <cfoutput>#DateFormat(URL.month,'MMMM')#</cfoutput>:</td>
                <td width="429"><cfoutput>#qGetHits.RecordCount#</cfoutput></td>
              </tr>
              <tr>
                <td>Total Hits All Time:</td>
                <td><cfoutput>#qGetLogs.RecordCount#</cfoutput></td>
              </tr>
              <tr>
                <td colspan="2" height="20"></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                      <td><strong>Content</strong></td>
                      <td><strong>Host IP</strong></td>
                      <td width="200"><strong>Referer</strong></td>
                      <td><strong>View Date</strong></td>
                    </tr>
                    <cfloop query="qGetHits">
                      <tr>
                        <td><cfoutput>#qGetHits.contentId#</cfoutput></td>
                        <td><cfoutput>#qGetHits.viewHostIP#</cfoutput></td>
                        <td  width="200"><cfoutput>#qGetHits.viewReferer#</cfoutput></td>
                        <td><cfoutput>#DateFormat(qGetHits.viewDate,'MMM dd yyyy')# #TimeFormat(qGetHits.viewDate,'hh:mm tt')#</cfoutput></td>
                      </tr>
                    </cfloop>
                  </table></td>
              </tr>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="padding-left:40px;"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0"  /></a><a href="listCategories.cfm" style="padding-left: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"  /></a><br />
    </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
