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
<cfparam name="URL.z" default="">
<cfif URL.z EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- set-up uuid variable --->
<cfset uuid = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- query db for user --->
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#uuid#'
</cfquery>
<!--- check for existence of record --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="listMembers.cfm?err=1">
</cfif>
<!--- delete member account --->
<cfquery name="qPutMember" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_userbase WHERE uuid = '#uuid#'
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Member Droppedd">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/dropMemberSuccessBoxTitle.gif" alt="Member Dropped" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
              <tr>
                <td><div style=" font-family:Verdana, Arial, Helvetica, sans-serif; font-weight:bold; font-size:12; padding-left: 40px;"> Successfully dropped the member, <cfoutput>#Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX')#</cfoutput>. </div></td>
              </tr>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="listMembers.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/membersButton.gif" alt="Member List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
