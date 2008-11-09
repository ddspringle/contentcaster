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
<!--- get all members from the database --->
<cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Member List">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3"><img src="../images/membersListBoxTitle.gif" alt="Members List" width="673" height="55" /></td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><table width="645" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="100" scope="col">Username</th>
                <th width="125" scope="col">Real<br />
                  Name </th>
                <th width="50" scope="col">Level</th>
                <th width="75" scope="col">Member<br />
                  Since </th>
                <th width="150" scope="col">Last On</th>
                <th width="18" scope="col"></th>
                <th width="18" scope="col"></th>
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
                <!--- wrap the table row in a cfoutput and use the rowC variable to set --->
                <!--- the background color --->
                <cfoutput>
                  <tr>
                    <td><tr style="background-color:###rowC#">
                    </td>
                  </tr>
                </cfoutput>
                <!--- output data from user base, decrypting encrypted values on the fly --->
                <td width="100"><div style="padding:2px"><cfoutput>#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#</cfoutput></div></td>
                <tr>
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
                  <td width="18"><div style="padding-left: 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput><a href="editMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/page_edit.png" alt="Edit Member" border="0"/></a></cfoutput></div></td>
                  <td width="18"><div style="padding-right: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt;"><cfoutput><a href="dropMember.cfm?z=#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/cancel.png" border="0"/></a></cfoutput></div></td>
                </tr>
                <!--- cycle back for the next record, if any --->
              </cfloop>
            </table></td>
          <td class="newUserRight">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" class="newUserFooter">&nbsp;</td>
        </tr>
      </table>
      <br />
      <br />
      <a href="inviteMember.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/inviteMemberButton.gif" alt="Invite Member" width="140" height="47" border="0" /></a> <a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" style="padding-left:5px;"/></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
