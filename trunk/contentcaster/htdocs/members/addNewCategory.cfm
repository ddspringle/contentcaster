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
<cfparam name="FORM.uuid" default="">
<cfparam name="FORM.categoryId" default="">
<cfparam name="FORM.categoryName" default="">
<cfparam name="FORM.categoryDesc" default="">
<!--- check for existence of data --->
<!--- NOTE: categoryDesc is not mandatory, so not checked --->
<cfif FORM.uuid EQ "" OR FORM.categoryId EQ "" or FORM.categoryName EQ "">
  <cflocation url="createCategory.cfm?err=1">
</cfif>
<!--- remove any spaces from categoryId (JIC) --->
<cfset FORM.categoryId = Replace(FORM.categoryId,' ','','ALL')>
<!--- create new ucid --->
<cfset ucid = CreateUUID()>
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
<!--- verify the categoryId is unique --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE categoryId = '#FORM.categoryId#'
</cfquery>
<!--- check for records returned --->
<cfif qGetCat.RecordCount GT 0>
  <!--- categoryId already exists, redirect back --->
  <cflocation url="createCategory.cfm?err=2&amp;a=#dbCategoryName#&amp;b=#dbCategoryDesc#&amp;c=#FORM.categoryId#">
</cfif>
<!--- add the new category to the database --->
<cfquery name="qPutCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
INSERT INTO a_categorybase (ucid, uuid, categoryId, categoryName, categoryDesc, addedOn) VALUES ('#ucid#', '#decUuid#', '#FORM.categoryId#', '#dbCategoryName#', '#dbCategoryDesc#', '#DateFormat(Now(),'yyyy-mm-dd')#')
</cfquery>
<cfset newDir = contentPath & FORM.categoryId>
<cfif NOT DirectoryExists(newDir)>
  <cftry>
    <cfdirectory directory="#contentPath##FORM.categoryId#" action="create" mode="777">
    <cfcatch type="any">
      <cfoutput>An error occured trying to create the directory#newDir#. Please ensure that the parent directory,#contentPath#, is world-writeable (0777 or rwxrwxrwx) if hosting on a linux system and/or using Coldfusion sandbox security features. #cfcatch.Message#</cfoutput>
    </cfcatch>
  </cftry>
</cfif>
<!--- check if email to admin configured --->
<cfif emailOnCreate EQ 1>
  <!--- query userbase for name info --->
  <cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE uuid = '#decUuid#'
  </cfquery>
  <!--- send email to specified member on creation --->
  <cfmail from="#fromEmail#" to="#createTo#" bcc="#bccEmail#" server="#mailServer#" port="#mailPort#" username="#mailUser#" password="#mailPass#" type="html" mailerid="<cfoutput>#siteTitle#</cfoutput> v#version#" subject="#createSubject#">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title></title>
    </head>
    <body>
    <p>A new category has been created for #Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')# (#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#), on #DateFormat(Now(),'mm/dd/yyyy')# with the following Id and description:</p>
    <p>ID:&nbsp;&nbsp;#FORM.categoryId#</p>
    <p>Name:&nbsp;&nbsp;#FORM.categoryName#</p>
    <p>Desc:&nbsp;&nbsp;#FORM.categoryDesc#</p>
    </body>
    </html>
  </cfmail>
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Category Added">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="newCategorySuccessTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="successTable"><cfoutput>
              <table>
                <tr>
                  <td colspan="2">A new category,&nbsp;#FORM.categoryName#, has been created for&nbsp;#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#,&nbsp;#Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')#&nbsp;(#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#), on&nbsp;#DateFormat(Now(),'mm/dd/yyyy')#&nbsp;with the following information:</td>
                </tr>
                <tr>
                  <td>ID:</td>
                  <td>#FORM.categoryId#</td>
                </tr>
                <tr>
                  <td>Name:</td>
                  <td>#FORM.categoryName#</td>
                </tr>
                <tr>
                  <td>Desc:</td>
                  <td>#FORM.categoryDesc#</td>
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
