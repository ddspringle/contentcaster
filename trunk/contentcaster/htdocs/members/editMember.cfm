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
  <cflocation url="listMembers.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- query the database for this member --->
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#newZ#'
</cfquery>
<!--- check for existence of record --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="listMembers.cfm?err=2">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Edit Member">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/editMemberBoxTitle.gif" alt="Edit Member" width="673" height="54" /></td>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="667"> This form allows you to modify members accounts. The application will automatically email the member their new username (their email address) and system password (which they can change later) if these are modified as part of this editing session. To reset a users password select the Send new password checkbox and the system will automatically generate a new password. <br />
            <!--- display any error messages, will be blank if none --->
            <br />
            <cfoutput>#errorText#</cfoutput>
            <form id="form1" name="form1" method="post" action="updateMember.cfm">
              <cfoutput>
                <input type="hidden" name="uuid" value="#URL.z#" />
                <table width="619">
                  <tr>
                    <td width="208" class="boldText">First Name:</td>
                    <td width="399"><input name="firstName" type="text" class="footerText" id="firstName" style="border: 1px solid ##000000; width: 210px;" value="#Decrypt(qGetMember.firstName,fishkey,'BLOWFISH','HEX')#" size="30" /></td>
                  </tr>
                  <tr>
                    <td class="boldText">Last Name:</td>
                    <td><input name="lastName" type="text" class="footerText" id="lastName" style="border: 1px solid ##000000; width: 230px;"value="#Decrypt(qGetMember.lastName,fishkey,'BLOWFISH','HEX')#" size="30" /></td>
                  </tr>
                  <tr>
                    <td class="boldText">Email:</td>
                    <td><input name="email" type="text" class="footerText" id="email" style="border: 1px solid ##000000; width: 522px;" value="#Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX')#" size="60" /></td>
                  </tr>
                  <tr>
                    <td class="boldText">Level:</td>
                    <td><select name="level" class="footerText" style="border: 1px solid ##000000; ">
                        <cfif qGetMember.level EQ 0>
                          <option value="0" selected="selected">User</option>
                          <option value="1">Admin</option>
                          <cfelse>
                          <option value="0">User</option>
                          <option value="1" selected="selected">Admin</option>
                        </cfif>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2"><input type="checkbox" name="newPass" value="1" style="margin-left: 53px;"/>
                      &nbsp;Check to send new password</td>
                  </tr>
                  <tr>
                    <td colspan="2"><input src="../images/changeButton.gif"type="image" name="Submit" value="Update" style="padding-left: 53px;" /></td>
                  </tr>
                </table>
              </cfoutput>
            </form></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="inviteMember.cfm" style="padding-left: 40px;"><img src="../images/membersButton.gif" alt="Member List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
