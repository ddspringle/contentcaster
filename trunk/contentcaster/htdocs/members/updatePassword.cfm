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
<cfparam name="FORM.oldPassword" default="">
<cfparam name="FORM.newPassword" default="">
<cfparam name="FORM.verifyPassword" default="">
<!--- query userbase for username --->
<cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE uuid = '#auth[1]#'
</cfquery>
<!--- check for existing record, if no record then error --->
<cfif qGetMember.RecordCount EQ 0>
  <cflocation url="index.cfm?err=3">
</cfif>
<!--- check password --->
<cfset decPwd = Decrypt(qGetMember.password,fishkey,'BLOWFISH','HEX')>
<cfif FORM.oldPassword NEQ decPwd>
  <cflocation url="changePassword.cfm?err=1">
</cfif>
<!--- verify new password --->
<cfif FORM.newPassword NEQ FORM.verifyPassword>
  <cflocation url="changePassword.cfm?err=2">
</cfif>
<!--- update database --->
<cfquery name="qUpdMember" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_userbase SET password = '#Encrypt(FORM.newPassword,fishkey,'BLOWFISH','HEX')#' WHERE uuid = '#auth[1]#'
</cfquery>
<!--- delete previous cookie --->
<cfcookie name="ccast_sessionId" value="*" expires="now">
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Password Updated">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="passwordUpdateSuccessTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="successTable"><cfoutput>
              <table>
                <tr>
                  <td>Your password has been successfully changed. Please <a href="index.cfm">Login</a> again to verify your new password. If you experience any difficulties with your new password please send an email to <a href="mailto:#fromEmail#">#fromEmail#</a> to have your password automatically regenerated.</td>
                </tr>
              </table>
            </cfoutput></td>
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
    <td class="navStyle"><a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">

