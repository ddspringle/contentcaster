<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cflocation url="index.cfm?err=5">
</cfif>
<!--- get all members from the database --->
<cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Member List">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/membersListBoxTitle.gif" alt="Members List" width="673" height="55" /></td>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="667"><table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="100" scope="col">Username</th>
                <th width="125" scope="col">Real<br />
                  Name </th>
                <th width="50" scope="col">Level</th>
                <th width="75" scope="col">Member<br />
                  Since </th>
                <th width="150" scope="col">Last On</th>
                <th width="75" scope="col">Edit</th>
                <th width="75" scope="col">Drop</th>
              </tr>
              <cfset rC = 0>
              <!--- loop through results --->
              <cfloop query="qGetMembers">
                <!--- the following code simply flip-flops a flag from 0 to 1 and back --->
                <!--- depending on the current state of the flag (1 or 0) determines --->
                <!--- the color used for the background of the row --->
                <!--- if the current state of the flag is 0 --->
                <cfif rC EQ 0>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "FFFFFF">
                  <!--- set the state of the flag to 1 (for next pass) --->
                  <cfset rC = 1>
                  <!--- otherwise... --->
                  <cfelse>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "CCCCCC">
                  <!--- set the state of the flag to 0 (for next pass) --->
                  <cfset rC = 0>
                  <!--- fin --->
                </cfif>
                <!--- wrap the table row in a cfoutput and use the rowC variable to set --->
                <!--- the background color --->
                <cfoutput><tr style="background-color:###rowC#">
                  
                </cfoutput>
                <!--- output data from user base, decrypting encrypted values on the fly --->
                <td width="100"><div style="padding:2px"><cfoutput>#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                <td width="125"><div style="padding:2px; text-align:center"><cfoutput>#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                  <td width="50"><div style="padding:2px">
                      <!--- change the numeric level stored in the database into a human readable label --->
                      <cfif qGetMembers.level EQ 0>
                        User
                        <cfelse>
                        Admin
                      </cfif>
                    </div></td>
                  <td width="75"><div style="padding:2px"><cfoutput>#DateFormat(qGetMembers.memberSince,'mm/dd/yyyy')#</cfoutput></div></td>
                  <td width="80"><div style="padding:2px"><cfoutput>#DateFormat(qGetMembers.lastOn,'mm/dd/yy')# #TimeFormat(qGetMembers.lastOn,'hh:mm tt')#</cfoutput></div></td>
                  <!--- double encrypt, BASE64 on pass 1, HEX on pass 2, before sending across URL --->
                  <td width="75"><div style="padding:2px; text-align:center"><cfoutput><a href="editMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#">E</a></cfoutput></div></td>
                  <td width="75"><div style="padding:2px; text-align:center"><cfoutput><a href="dropMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#">D</a></cfoutput></div></td>
                </tr>
                <!--- cycle back for the next record, if any --->
              </cfloop>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br>
      <br />
      <a href="inviteMember.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/inviteMemberButton.gif" alt="Invite Member" width="140" height="47" border="0" /></a> <a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
