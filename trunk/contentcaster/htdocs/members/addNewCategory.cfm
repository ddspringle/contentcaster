<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfif COOKIE.ccast_sessionId EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<cfinvoke component="adminSess" method="adminSess" tcCookie="#COOKIE.ccast_sessionId#" returnvariable="auth">
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
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE categoryId = '#FORM.categoryId#'
</cfquery>
<!--- check for records returned --->
<cfif qGetCat.RecordCount GT 0>
  <!--- categoryId already exists, redirect back --->
  <cflocation url="createCategory.cfm?err=2&amp;a=#dbCategoryName#&amp;b=#dbCategoryDesc#&amp;c=#FORM.categoryId#">
</cfif>
<!--- add the new category to the database --->
<cfquery name="qPutCat" datasource="#ds#" username="#un#" password="#pw#">
INSERT INTO a_categorybase (ucid, uuid, categoryId, categoryName, categoryDesc, addedOn) VALUES ('#ucid#', '#decUuid#', '#FORM.categoryId#', '#dbCategoryName#', '#dbCategoryDesc#', '#DateFormat(Now(),'yyyy-mm-dd')#')
</cfquery>
<cfset newDir = contentPath & FORM.categoryId>
<cfif NOT DirectoryExists(newDir)>
  <cftry>
    <cfdirectory directory="#contentPath##FORM.categoryId#" action="create" mode="0777">
    <cfcatch type="any">
      <cfoutput>An error occured trying to create the directory#newDir#. Please ensure that the parent directory,#contentPath#, is world-writeable (0777 or rwxrwxrwx) if hosting on a linux system and/or using Coldfusion sandbox security features.</cfoutput>
    </cfcatch>
  </cftry>
</cfif>
<!--- check if email to admin configured --->
<cfif emailOnCreate EQ 1>
  <!--- query userbase for name info --->
  <cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#decUuid#'
  </cfquery>
  <!--- send email to specified member on creation --->
  <cfmail from="#fromEmail#" to="#createTo#" bcc="#bccEmail#" server="#mailServer#" port="#mailPort#" username="#mailUser#" password="#mailPass#" type="html" mailerid="<cfoutput>#siteTitle#</cfoutput> v#version#" subject="#createSubject#">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title></title>
    </head>
    <body>
    <p>A new category, #FORM.categoryName#, has been created for #Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')# (#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#), on #DateFormat(Now(),'mm/dd/yyyy')# with the following Id and description:</p>
    <p>ID:&nbsp;&nbsp;#FORM.categoryId#</p>
    <p>Name:&nbsp;&nbsp;#FORM.categoryName#</p>
    <p>Desc:&nbsp;&nbsp;#FORM.categoryDesc#</p>
    </body>
    </html>
  </cfmail>
</cfif>
<!--- additional HTML here if you want --->
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Category Added">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<cfoutput>
  <table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
    <tr>
      <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
      <td bgcolor="##CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
          <tr>
            <td colspan="3"><img src="../images/newCategorySuccessBoxTitle.gif" alt="Category Added" width="673" height="54" /></td>
          </tr>
          <tr>
            <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
            <td class="textTable" width="655"><div style="padding-left:5px;"> A new category,&nbsp;#FORM.categoryName#, has been created for&nbsp;#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#,&nbsp;#Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')#&nbsp;(#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#), on&nbsp;#DateFormat(Now(),'mm/dd/yyyy')#&nbsp;with the following information:<br />
                <br />
                ID:&nbsp;&nbsp;<strong>#FORM.categoryId#</strong><br />
                <br />
                Name:&nbsp;&nbsp;<strong>#FORM.categoryName#</strong><br />
                <br />
                Desc:&nbsp;&nbsp;<strong>#FORM.categoryDesc#</strong><br />
              </div>
            </td>
            <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
          </tr>
          <tr>
            <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
          </tr>
        </table>
        <br />
        <a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a><br />
      </td>
      <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
    </tr>
  </table>
</cfoutput>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
