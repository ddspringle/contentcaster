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
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE uuid = '#newZ#'
</cfquery>
<!--- check for existence of record --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="listMembers.cfm?err=2">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Edit Member">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="editMemberTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"> This form allows you to modify members accounts. The application will automatically email the member their new username (their email address) and system password (which they can change later) if these are modified as part of this editing session. To reset a users password select the Send new password checkbox and the system will automatically generate a new password. <br />
            <!--- display any error messages, will be blank if none --->
            <br />
            <cfoutput>#errorText#</cfoutput>
            <form id="form1" name="form1" method="post" action="updateMember.cfm">
              <cfoutput>
                <input type="hidden" name="uuid" value="#URL.z#" />
                <table width="619">
                  <tr>
                    <td width="208" class="boldText">First Name:</td>
                    <td width="399"><input name="firstName" type="text" class="fieldBorder" id="firstName" style="width: 210px;" value="#Decrypt(qGetMember.firstName,fishkey,'BLOWFISH','HEX')#" /></td>
                  </tr>
                  <tr>
                    <td class="boldText">Last Name:</td>
                    <td><input name="lastName" type="text" class="fieldBorder" id="lastName" style="width: 230px;" value="#Decrypt(qGetMember.lastName,fishkey,'BLOWFISH','HEX')#" /></td>
                  </tr>
                  <tr>
                    <td class="boldText">Email:</td>
                    <td><input name="email" type="text" class="fieldBorder" id="email" style="width: 500px;" value="#Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX')#" /></td>
                  </tr>
                  <tr>
                    <td class="boldText">Level:</td>
                    <td><select name="level" class="fielBorder" style="border: 1px solid ##000000; ">
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
                    <td colspan="2"><input src="../images/changeButton.gif" type="image" name="Submit" value="Update" style="padding-left: 53px;" /></td>
                  </tr>
                </table>
              </cfoutput>
            </form></td>
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
    <td class="navStyle"><a href="inviteMember.cfm"><img src="../images/membersButton.gif" alt="Member List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
