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
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "The email address you entered is already a member. Please choose a different email address if this is a new member, or edit this member below.">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
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
<cfset pageName = "Invite Member">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/newUserBoxTitle.gif" alt="New Member" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><cfif errorText NEQ "">
              <div style="background-color:#FFFFFF; color:#FF0000; font-weight:bold; padding:5px;"><cfoutput>#errorText#</cfoutput></div>
              <br />
            </cfif>
            This form allows you to invite members and create accounts by entering the first and last name, email address and user level below, and then clicking submit. The application will automatically email the member their username (their email address) and system password (which they can change later). <br />
            <br />
            <!--- display any error messages, will be blank if none --->
            <cfoutput>#errorText#</cfoutput>
            <form id="form1" name="form1" method="post" action="sendMemberInvite.cfm">
              <table width="619">
                <tr>
                  <td width="208" class="boldText">First Name:</td>
                  <td width="399"><input name="firstName" type="text" class="footerText" id="firstName" style="border: 1px solid ##000000; width: 210px;" value="" size="30" /></td>
                </tr>
                <tr>
                  <td class="boldText">Last Name:</td>
                  <td><input name="lastName" type="text" class="footerText" id="lastName" style="border: 1px solid ##000000; width: 230px;"value="" size="30" /></td>
                </tr>
                <tr>
                  <td class="boldText">Email:</td>
                  <td><input name="email" type="text" class="footerText" id="email" style="border: 1px solid ##000000; width: 522px;" value="" size="60" /></td>
                </tr>
                <tr>
                  <td class="boldText">Level:</td>
                  <td><select name="level" class="footerText" style="border: 1px solid ##000000; ">
                      <option value="0" selected="selected">User</option>
                      <option value="1">Admin</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td colspan="2"><input src="../images/addButton.gif" type="image" name="Submit" value="Submit" style="padding-left: 85px;" /></td>
                </tr>
              </table>
            </form>
            <!--- include the footer template --->
          </td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
        <tr>
          <td colspan="3" height="30"></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/membersListBoxTitle.gif" alt="Members List" width="673" height="55" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td bgcolor="#0091B5"><table width="661" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#000000" height="20">
                <td style="font-weight: bold; padding-left: 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; color: #ffffff;">Username</td>
                <td style="font-weight: bold; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; color: #ffffff;">Real Name </td>
                <td style="font-weight: bold; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; color: #ffffff;">Level</td>
                <td style="font-weight: bold; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; color: #ffffff;">Added </td>
                <td style="font-weight: bold; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; color: #ffffff;">Last On</td>
                <td style="font-weight: bold; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; color: #ffffff;"></td>
                <td style="font-weight: bold; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 8pt; color: #ffffff;"></td>
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
                  <cfset rowC = "66CC00">
                  <!--- set the state of the flag to 1 (for next pass) --->
                  <cfset rC = 1>
                  <!--- otherwise... --->
                  <cfelse>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "B3E680">
                  <!--- set the state of the flag to 0 (for next pass) --->
                  <cfset rC = 0>
                  <!--- fin --->
                </cfif>
                <!--- wrap the table row in a cfoutput and use the rowC variable to set --->
                <!--- the background color --->
                <cfoutput>
                  <tr>
                    <td><tr style="background-color:###rowC#" height="15"></td>
                  </tr>
                </cfoutput>
                <!--- output data from user base, decrypting encrypted values on the fly --->
                <td width="251"><div style="text-align: left; padding:10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput>#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                <tr>
                  <td width="110"><div style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput>#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                  <td width="50"><div style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;">
                      <!--- change the numeric level stored in the database into a human readable label --->
                      <cfif qGetMembers.level EQ 0>
                        User
                        <cfelse>
                        Admin
                      </cfif>
                    </div></td>
                  <td width="80"><div style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput>#DateFormat(qGetMembers.memberSince,'mm/dd/yyyy')#</cfoutput></div></td>
                  <td width="100"><div style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput>#DateFormat(qGetMembers.lastOn,'mm/dd/yy')# #TimeFormat(qGetMembers.lastOn,'hh:mm tt')#</cfoutput></div></td>
                  <!--- double encrypt, BASE64 on pass 1, HEX on pass 2, before sending across URL --->
                  <td width="30"><div style="padding-left: 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput><a href="editMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/editIcon.gif" alt="Edit Member" border="0"/></a></cfoutput></div></td>
                  <td width="40"><div style="padding-right: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput><a href="dropMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/deleteIcon.gif" border="0"/></a></cfoutput></div></td>
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
      <br />
      <a href="mainMenu.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<cfinclude template="../includes/footer.cfm">
