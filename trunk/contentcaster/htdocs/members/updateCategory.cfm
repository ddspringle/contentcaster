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
<cfparam name="FORM.ucid" default="">
<cfparam name="FORM.uuid" default="">
<cfparam name="FORM.categoryName" default="">
<cfparam name="FORM.categoryDesc" default="">
<!--- check for existence of data --->
<!--- NOTE: categoryDesc is not mandatory, so not checked --->
<cfif FORM.ucid EQ "" OR FORM.uuid EQ "" OR FORM.categoryName EQ "">
  <cflocation url="editCategory.cfm?err=1?z=#FORM.ucid#">
</cfif>
<!--- decrypt ucid --->
<cfset decUsid = Decrypt(Decrypt(FORM.ucid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- decrypt uuid --->
<cfset decUuid = Decrypt(Decrypt(FORM.uuid,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- encrypt data for database storage --->
<!--- encrypt the category name and category desc, if provided --->
<!--- NOTE: categoryId, ucid and uuid are NOT encrypted in this (or any) table --->
<cfset dbCategoryName = Encrypt(FORM.categoryName,fishkey,'BLOWFISH','HEX')>
<!--- check if category description field contains data --->
<cfif FORM.categoryDesc NEQ "">
  <!--- and encrypt it if it does --->
  <cfset dbCategoryDesc = Encrypt(FORM.categoryDesc,fishkey,'BLOWFISH','HEX')>
  <!--- otherwise... --->
  <cfelse>
  <!--- set dbCategoryDesc to a null value --->
  <cfset dbCategoryDesc = "">
  <!--- fin --->
</cfif>
<!--- update the category in the database --->
<cfquery name="qPutCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
UPDATE a_categorybase SET uuid = '#decUuid#', categoryName = '#dbCategoryName#', categoryDesc = '#dbCategoryDesc#' WHERE ucid = '#decUsid#'
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Category Updated">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="categoryUpdateSuccessTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="successTable"><table border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td><cfoutput>Your category,&nbsp;#FORM.categoryName#, has been updated on&nbsp;#DateFormat(Now(),'mm/dd/yyyy')#.</cfoutput></td>
              </tr>
            </table></td>
          <td class="newUserRight">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" class="newUserFooter">&nbsp;</td>
        </tr>
      </table>
      </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>  
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td class="navStyle"><a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
