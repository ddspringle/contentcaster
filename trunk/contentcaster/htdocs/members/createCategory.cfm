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
<cfparam name="URL.err" default="">
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
<!--- check for errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into the categoryId and Category Name fields.">
    <cfelseif URL.err EQ 2>
    <cfset errorText = "The categoryId you have chosen, #URL.c#, is already in use for another category. Please choose a different categoryId and try again.">
    <cfset URL.a = Decrypt(URL.a,fishkey,'BLOWFISH','HEX')>
    <cfset URL.b = Decrypt(URL.b,fishkey,'BLOWFISH','HEX')>
  </cfif>
  <cfelse>
  <cfset errorText = "">
  <cfset URL.a = "">
  <cfset URL.b = "">
</cfif>
<!--- check if admin or user for user assignment --->
<cfif level EQ "admin">
  <!--- get members to assign --->
  <cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
  <cfelse>
  <!--- get only the current member (currently logged in user) to assign --->
  <cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_userbase WHERE uuid = '#auth[1]#' ORDER BY lastName, firstName 
</cfquery>
</cfif>
<!--- set params --->
<cfparam name="URL.type" default="active">
<!--- categoryId, categoryName, categoryDesc, uuid, addedOn --->
<cfparam name="URL.sort" default="categoryId">
<!--- refactor uuid --->
<cfif URL.sort EQ "uuid">
<cfset URL.sort = "a_userbase.uuid">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Create Category">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="newCategoryBoxTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTable"><cfif errorText NEQ "">
              <div class="loginError"><cfoutput>#errorText#</cfoutput></div>
              <br />
            </cfif>
            Use the following form to create a new category
            <cfif level EQ "admin">
              and assign it to a user or admin
            </cfif>
            to manage. The categoryId will be used with the API (i.e. contentCaster.cfm?categoryId=&lt;categoryId&gt; and should contain no spaces. The category name is a human readable title for your category, visible on the website. Description is optional but provides additional information about the category to website visitors. <br />
            <br />
            <form id="addNewCategory" name="addNewCategory" method="post" action="addNewCategory.cfm">
              <table>
                <tr>
                  <td width="225" class="boldText">Member:</td>
                  <td width="480"><select name="uuid" class="fieldBorder" id="uuid" style="width: 400px;">
                      <cfloop query="qGetMembers">
                        <cfoutput>
                          <option value="#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#">#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')# (#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#)</option>
                        </cfoutput>
                      </cfloop>
                    </select></td>
                </tr>
                <tr>
                  <td class="boldText">Category ID:</td>
                  <td><input name="categoryId" type="text" class="fieldBorder" id="categoryId" style="width: 230px;" size="18" maxlength="12"/></td>
                </tr>
                <tr>
                  <td class="boldText">Category Name:</td>
                  <td><input name="categoryName" type="text" class="fieldBorder" id="categoryName" style="width: 230px;" value="<cfoutput>#URL.a#</cfoutput>" size="40"/></td>
                </tr>
                <tr>
                  <td class="boldText">Category Desc:</td>
                  <td><textarea name="categoryDesc" cols="40" rows="3" class="fieldBorder" id="categoryDesc" style="width: 230px;"><cfoutput>#URL.b#</cfoutput></textarea></td>
                </tr>
                <tr>
                  <td colspan="2"><input src="../images/addButton.gif" type="image" name="Submit" value="Submit" style="padding-left: 180px;"/></td>
                </tr>
              </table>
            </form></td>
          <td class="newUserRight">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3" class="newUserFooter">&nbsp;</td>
        </tr>
      </table>
      <div class="footerText">&nbsp;</div>
      <table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3" class="catListBoxTitle">&nbsp;</td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td><table border="0" cellspacing="0" cellpadding="0" class="listTable">
              <tr>
                <td colspan="10" class="viewCategoryOptions"><cfif URL.type EQ "all">
                    <!--- check for user or admin --->
                    <cfif level EQ "admin">
                      <!--- get all categories from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
										SELECT * FROM a_categorybase LEFT JOIN a_userbase ON a_categorybase.uuid = a_userbase.uuid ORDER BY archived, #URL.sort#
									</cfquery>
                      <cfelse>
                      <!--- get all categories for this user from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
										SELECT * FROM a_categorybase LEFT JOIN a_userbase ON a_categorybase.uuid = a_userbase.uuid WHERE uuid = '#auth[1]#' ORDER BY archived, categoryId
									</cfquery>
                    </cfif>
                    <cfoutput><a href="createCategory.cfm?type=all&amp;sort=#URL.sort#" class="viewCategoryLink"><strong>List All Categories</strong></a></cfoutput>
                    <cfelse>
                    <cfoutput><a href="createCategory.cfm?type=all&amp;sort=#URL.sort#" class="viewCategoryLink">List All Categories</a></cfoutput>
                  </cfif>
                  &nbsp;|&nbsp;
                  <cfif URL.type EQ "archived">
                    <!--- check for user or admin --->
                    <cfif level EQ "admin">
                      <!--- get archived categories from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
									  SELECT * FROM a_categorybase LEFT JOIN a_userbase ON a_categorybase.uuid = a_userbase.uuid WHERE archived = 1 ORDER BY archived, #URL.sort#
									  </cfquery>
                      <cfelse>
                      <!--- get archived categories for this user from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
									  SELECT * FROM a_categorybase LEFT JOIN a_userbase ON a_categorybase.uuid = a_userbase.uuid WHERE archived = 1 AND uuid = '#auth[1]#' ORDER BY archived, #URL.sort#
									  </cfquery>
                    </cfif>
                    <cfoutput><a href="createCategory.cfm?type=archived&amp;sort=#URL.sort#" class="viewCategoryLink"><strong>List Only Archived</strong></a></cfoutput>
                    <cfelse>
                    <cfoutput><a href="createCategory.cfm?type=archived&amp;sort=#URL.sort#" class="viewCategoryLink">List Only Archived</a></cfoutput>
                  </cfif>
                  &nbsp;|&nbsp;
                  <cfif URL.type EQ "active">
                    <!--- check for user or admin --->
                    <cfif level EQ "admin">
                      <!--- get active categories (default) from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
									  SELECT * FROM a_categorybase LEFT JOIN a_userbase ON a_categorybase.uuid = a_userbase.uuid WHERE archived = 0 ORDER BY archived, #URL.sort#
									  </cfquery>
                      <cfelse>
                      <!--- get active categories for this user from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
									  SELECT * FROM a_categorybase LEFT JOIN a_userbase ON a_categorybase.uuid = a_userbase.uuid WHERE archived = 0 AND uuid = '#auth[1]#' ORDER BY archived, #URL.sort#
									  </cfquery>
                    </cfif>
                    <cfoutput><a href="createCategory.cfm?type=active&amp;sort=#URL.sort#" class="viewCategoryLink"><strong>Active Categories Only</strong></a></cfoutput>
                    <cfelse>
                    <cfoutput><a href="createCategory.cfm?type=active&amp;sort=#URL.sort#" class="viewCategoryLink">Active Categories Only</a></cfoutput>
                  </cfif>
                </td>
              </tr>
              <tr class="newUserTableHeader">
                <td class="newUserHeaderFont" style="padding-left: 10px;" width="102"><cfoutput><a href="#CGI.SCRIPT_NAME#?sort=categoryId&amp;type=#URL.type#" class="newUserHeaderFont">Cat Id</a></cfoutput></td>
                <td class="newUserHeaderFont" width="140"><cfoutput><a href="#CGI.SCRIPT_NAME#?sort=categoryName&amp;type=#URL.type#" class="newUserHeaderFont">Category Name</a></cfoutput></td>
                <td class="newUserHeaderFont" width="170"><cfoutput><a href="#CGI.SCRIPT_NAME#?sort=categoryDesc&amp;type=#URL.type#" class="newUserHeaderFont">Category Desc</a></cfoutput></td>
                <td class="newUserHeaderFont" width="120"><cfif level EQ "admin">
                    <cfoutput><a href="#CGI.SCRIPT_NAME#?sort=uuid&amp;type=#URL.type#" class="newUserHeaderFont">Assigned</a></cfoutput>
                    <cfelse>
                    Assigned
                  </cfif></td>
                <td class="newUserHeaderFont" width="70"><cfoutput><a href="#CGI.SCRIPT_NAME#?sort=addedOn&amp;type=#URL.type#" class="newUserHeaderFont">Added</a></cfoutput></td>
                <td class="newUserHeaderFont" width="18">&nbsp;</td>
                <td class="newUserHeaderFont" width="18">&nbsp;</td>
                <td class="newUserHeaderFont" width="18">&nbsp;</td>
                <td class="newUserHeaderFont" width="18">&nbsp;</td>
                <td class="newUserHeaderFont" width="18">&nbsp;</td>
              </tr>
              <cfset rC = 0>
              <!--- loop through results --->
              <cfloop query="qGetCats">
                <!--- query userbase for this members information --->
                <cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
								SELECT * FROM a_userbase WHERE uuid = '#qGetCats.uuid#'
								</cfquery>
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
                <tr style="background-color:#<cfoutput>#rowC#</cfoutput>">
                  <td class="memberListPadded"><cfoutput>#qGetCats.categoryId#</cfoutput></td>
                  <td class="memberList"><cfoutput>#Decrypt(qGetCats.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td class="memberList"><cfoutput>#Decrypt(qGetCats.categoryDesc,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td class="memberList"><cfoutput><a href="mailto:#Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX')#" target="_blank">#Left(Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX'),15)#</a></cfoutput></td>
                  <td class="memberList"><cfoutput>#DateFormat(qGetCats.addedOn,'mm/dd/yy')#</cfoutput></td>
                  <td class="memberList"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="editCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/page_edit.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="Edit Category" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/page_edit_disabled.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="(Disabled)" />
                    </cfif>
                  </td>
                  <td class="memberList"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="planCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/date.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="Schedule Category" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/date_disabled.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="(Disabled)" />
                    </cfif>
                  </td>
                  <td class="memberList"><cfoutput> <a href="showCategoryLogs.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/chart_pie.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="Show Logs" /> </a> </cfoutput> </td>
                  <td class="memberList"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="archiveCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/disk.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="Archive Category" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/disk_disabled.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="(Disabled)" />
                    </cfif>
                  </td>
                  <td class="memberList"><cfoutput> <a href="dropCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/cancel.png" width="16" height="16" border="0" style="vertical-align:middle;" alt="Delete Category" /> </a> </cfoutput> </td>
                </tr>
              </cfloop>
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
    <td class="navStyle"><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
