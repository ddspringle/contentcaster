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
<cfparam name="URL.z" default="">
<cfif URL.z EQ "">
  <cflocation url="index.cfm?err=2">
</cfif>
<!--- set-up ucid variable --->
<cfset ucid = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- query db for user --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#ucid#'
</cfquery>
<!--- check for existence of record --->
<cfif qGetCat.RecordCount EQ 0>
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- delete category account --->
<cfquery name="qDelCategory" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_categorybase WHERE ucid = '#ucid#'
</cfquery>
<!--- delete categories schedule --->
<cfquery name="qDelSchedule" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_categoryschedule WHERE ucid = '#ucid#'
</cfquery>
<!--- delete category contents --->
<cfquery name="qDelContents" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_categorybase WHERE ucid = '#ucid#'
</cfquery>
<!--- delete default schedule --->
<cfquery name="qDelDefSchedule" datasource="#ds#" username="#un#" password="#pw#">
DELETE FROM a_defaultcategoryschedule WHERE ucid = '#ucid#'
</cfquery>
<!--- remove the files and directory --->
<cftry>
  <cfdirectory directory="#contentPath##qGetCat.categoryId#" action="delete" recurse="yes">
  <cfcatch type="any"></cfcatch>
</cftry>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Category Dropped">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="dropCategorySuccessTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="successTable"><table border="0" cellspacing="0" cellpadding="2" class="textTable">
              <tr>
                <td>Successfully dropped the category, <cfoutput>#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')# (#qGetCat.categoryId#)</cfoutput>.</td>
              </tr>
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
    <td class="navStyle"><a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" border="0" alt="New Category" /></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" border="0" alt="List Categories" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" border="0" alt="Main Menu"/></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
