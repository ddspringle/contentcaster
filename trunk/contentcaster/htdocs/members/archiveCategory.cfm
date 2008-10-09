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
<cfparam name="URL.z" default="">
<!--- check for existence of 'z' --->
<cfif URL.z EQ "">
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get data for category --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- set archive flag in database --->
<cfquery name="qUpdCategory" datasource="#ds#" username="#un#" password="#pw#">
UPDATE a_categorybase SET archived = 1 WHERE ucid = '#newZ#'
</cfquery>
<!---                             --->
<!--- TODO: Add schedule removal! --->
<!---                             --->
<!--- HTML --->
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Category Archived">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td  bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="667">
        <tr>
          <td colspan="3"><img src="../images/archiveCategorySuccessBoxTitle.gif" alt="Content Archived" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif" width="6"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><p>Your category, <cfoutput>#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput>, has been moved to the archives. It will no longer display in the list of active categories and will no longer be capable of running on a schedule. It will be visible only from the archives section of the admin interface, user interface (if user archived) and through the website. This action is currently irreversible - all schedule data associated with this category has been removed.</p></td>
          <td background="../images/newUserBox_right.gif" width="3"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="padding-left: 40px;"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0"/></a><a href="listCategories.cfm" style="padding-left: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a><br />
    </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
