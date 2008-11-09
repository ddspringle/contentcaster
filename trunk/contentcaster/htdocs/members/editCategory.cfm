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
  <cflocation url="listCategories.cfm?err=1">
</cfif>
<!--- decrypt the passed value --->
<cfset newZ = Decrypt(Decrypt(URL.z,fishkey,'BLOWFISH','HEX'),fishkey,'BLOWFISH','BASE64')>
<!--- get data for category --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get members to assign --->
<cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Edit Category">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="editCategoryBoxTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"> Use the following form to edit your category and re-assign it to a user or admin to manage. The categoryId CANNOT be changed once created. If you wish to change the categoryId you must drop this category and add a new one. The category name is a human readable title for your category, visible on the website. Description is optional but provides additional information about the category to website visitors. <br />
            <br />
            <form id="updateCategory" name="updateCategory" method="post" action="updateCategory.cfm">
              <cfoutput>
                <input type="hidden" name="ucid" value="#Encrypt(Encrypt(qGetCat.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#" />
              </cfoutput>
              <table>
                <tr>
                  <td width="225" class="boldText">Member:</td>
                  <td width="480"><select name="uuid" class="fieldBorder" id="uuid" style="width: 400px;">
                      <cfloop query="qGetMembers">
                        <cfoutput>
                          <option value="#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#" <cfif qGetCat.uuid EQ qGetMembers.uuid>selected="selected"</cfif>>#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')# (#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#)</option>
                        </cfoutput>
                      </cfloop>
                    </select></td>
                </tr>
                <tr>
                  <td class="boldText">Category ID:</td>
                  <td><input name="categoryId" type="text" class="fieldBorder" id="categoryId" style="width: 230px;" size="18" maxlength="12" value="<cfoutput>#qGetCat.categoryId#</cfoutput>" disabled="disabled"/></td>
                </tr>
                <tr>
                  <td class="boldText">Category Name:</td>
                  <td><input name="categoryName" type="text" class="fieldBorder" id="categoryName" style="width: 230px;" value="<cfoutput>#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput>" size="40"/></td>
                </tr>
                <tr>
                  <td class="boldText">Category Desc:</td>
                  <td><textarea name="categoryDesc" cols="40" rows="3" class="fieldBorder" id="categoryDesc" style="width: 230px;"><cfoutput>#Decrypt(qGetCat.categoryDesc,fishkey,'BLOWFISH','HEX')#</cfoutput></textarea></td>
                </tr>
                <tr>
                  <td colspan="2"><input src="../images/changeButton.gif" type="image" name="Submit" value="Update" style="padding-left: 180px;"/></td>
                </tr>
              </table>
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
    <td class="navStyle"><a href="createCategory.cfm"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
