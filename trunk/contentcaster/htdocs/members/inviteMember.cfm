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
<cfinvoke component="/components/adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
<cfif auth[2] NEQ 1>
  <cflocation url="index.cfm?err=5">
</cfif>
<!--- get all members from the database --->
<cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Invite Member">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="newUserTitle" >&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><cfif errorText NEQ "">
              <div class="loginError"><cfoutput>#errorText#</cfoutput></div>
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
                  <td width="399"><input name="firstName" type="text" id="firstName" class="fieldBorder" style="width:210" /></td>
                </tr>
                <tr>
                  <td class="boldText">Last Name:</td>
                  <td><input name="lastName" type="text" id="lastName" class="fieldBorder" style="width: 230px;" value="" size="30" /></td>
                </tr>
                <tr>
                  <td class="boldText">Email:</td>
                  <td><input name="email" type="text" id="email" class="fieldBorder" style="width: 522px;" value="" size="60" /></td>
                </tr>
                <tr>
                  <td class="boldText">Level:</td>
                  <td><select name="level" style="">
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
          <td class="newUserRight">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" class="newUserFooter">&nbsp;</td>
        </tr>
      </table>
      <div class="footerText">&nbsp;</div>
      <table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="memberListTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><table border="0" cellspacing="0" cellpadding="0">
              <tr class="newUserTableHeader">
                <td class="newUserHeaderFont" style="padding-left:10px;">Username</td>
                <td class="newUserHeaderFont">Real Name</td>
                <td class="newUserHeaderFont">Level</td>
                <td class="newUserHeaderFont">Added</td>
                <td class="newUserHeaderFont">Last On</td>
                <td class="newUserHeaderFont">&nbsp;</td>
                <td  class="newUserHeaderFont">&nbsp;</td>
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
                <!--- output data from user base, decrypting encrypted values on the fly --->
                <tr style="background-color:#<cfoutput>#rowC#</cfoutput>">
                  <td width="251"><div class="memberListPadded"><cfoutput>#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                  <td width="110"><div class="memberList"><cfoutput>#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                  <td width="50"><div class="memberList">
                      <!--- change the numeric level stored in the database into a human readable label --->
                      <cfif qGetMembers.level EQ 0>
                        User
                        <cfelse>
                        Admin
                      </cfif>
                    </div></td>
                  <td width="80"><div class="memberList"><cfoutput>#DateFormat(qGetMembers.memberSince,'mm/dd/yyyy')#</cfoutput></div></td>
                  <td width="100"><div class="memberList"><cfoutput>#DateFormat(qGetMembers.lastOn,'mm/dd/yy')#<br />
                        #TimeFormat(qGetMembers.lastOn,'hh:mm tt')#</cfoutput></div></td>
                  <!--- double encrypt, BASE64 on pass 1, HEX on pass 2, before sending across URL --->
                  <td width="30"><div class="memberListPadded"><cfoutput><a href="editMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/user_edit.png" alt="Edit Member" border="0"/></a></cfoutput></div></td>
                  <td width="40"><div class="memberListPadded"><cfoutput><a href="dropMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/cancel.png" alt="Delete Member" border="0"/></a></cfoutput></div></td>
                </tr>
                <!--- cycle back for the next record, if any --->
              </cfloop>
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
    <td class="navStyle"><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<cfinclude template="../includes/footer.cfm">
