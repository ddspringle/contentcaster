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
<cfquery name="qPutCat" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_categorybase SET uuid = '#decUuid#', categoryName = '#dbCategoryName#', categoryDesc = '#dbCategoryDesc#' WHERE ucid = '#decUsid#'
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Category Updated">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/categoryUpdateSuccessBoxTitle.gif" alt="Category Updated" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="667"><table width="661" border="0" cellspacing="0" cellpadding="2" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
              <tr>
                <td><p> <span style="font-family:Verdana, Arial, Helvetica, sans-serif; font-weight:bold; font-size:10pt; padding-left: 40px;"> <cfoutput>Your category,&nbsp;#FORM.categoryName#, has been updated on&nbsp;#DateFormat(Now(),'mm/dd/yyyy')# </span> <br>
                    </cfoutput> </p></td>
              </tr>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="font-size: 11px; padding-left: 20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
