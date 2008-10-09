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
<cfparam name="URL.type" default="active">
<cfparam name="URL.err" default="">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into all of the fields and click submit to proceed.">
    <cfelseif URL.err EQ 2>
    <cfset errorText = "You must do something else here!">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "List Categories">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/categoryListBoxTitle.gif" alt="Category List" width="673" height="55" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><table cellpadding="0" cellspacing="0" border="0" width="645">
              <tr>
                <td colspan="10" bgcolor="#00FFFF" height="20"><span style="padding-top: 4px; padding-bottom: 4px; padding-left: 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color: #000000; text-decoration: none;">
                  <cfif errorText NEQ "">
                    <div style="background-color:#FFFFFF; color:#FF0000; font-weight:bold; padding:5px;"><cfoutput>#errorText#</cfoutput></div>
                    <br />
                  </cfif>
                  <cfif URL.type EQ "all">
                    <!--- check for user or admin --->
                    <cfif level EQ "admin">
                      <!--- get all categories from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
					  SELECT * FROM a_categorybase ORDER BY archived, categoryId
					  </cfquery>
                      <cfelse>
                      <!--- get all categories for this user from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
					  SELECT * FROM a_categorybase WHERE uuid = '#auth[1]#' ORDER BY archived, categoryId
					  </cfquery>
                    </cfif>
                    <a href="listCategories.cfm?type=all" style="color: #000000; text-decoration:none;"><strong>List All Categories</strong></a>
                    <cfelse>
                    <a href="listCategories.cfm?type=all" style="color: #000000; text-decoration:none;">List All Categories</a>
                  </cfif>
                  &nbsp;|&nbsp;
                  <cfif URL.type EQ "archived">
                    <!--- check for user or admin --->
                    <cfif level EQ "admin">
                      <!--- get archived categories from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
					  SELECT * FROM a_categorybase WHERE archived = 1 ORDER BY categoryId
					  </cfquery>
                      <cfelse>
                      <!--- get archived categories for this user from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
					  SELECT * FROM a_categorybase WHERE archived = 1 AND uuid = '#auth[1]#' ORDER BY categoryId
					  </cfquery>
                    </cfif>
                    <a href="listCategories.cfm?type=archived" style="color: #000000; text-decoration:none;"><strong>List Only Archived</strong></a>
                    <cfelse>
                    <a href="listCategories.cfm?type=archived" style="color: #000000; text-decoration:none;">List Only Archived</a>
                  </cfif>
                  &nbsp;|&nbsp;
                  <cfif URL.type EQ "active">
                    <!--- check for user or admin --->
                    <cfif level EQ "admin">
                      <!--- get active categories (default) from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
					  SELECT * FROM a_categorybase WHERE archived = 0 ORDER BY categoryId
					  </cfquery>
                      <cfelse>
                      <!--- get active categories for this user from the database --->
                      <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
					  SELECT * FROM a_categorybase WHERE archived = 0 AND uuid = '#auth[1]#' ORDER BY categoryId
					  </cfquery>
                    </cfif>
                    <a href="listCategories.cfm?type=active" style="color: #000000; text-decoration:none;"><strong>Active Categories Only</strong></a>
                    <cfelse>
                    <a href="listCategories.cfm?type=active" style="color: #000000; text-decoration:none;">Active Categories Only</a>
                  </cfif>
                  </span> <br />
                </td>
              </tr>
              <tr>
                <td height="2" colspan="10" bgcolor="#0091B5"></td>
              </tr>
              <tr height="20" bgcolor="#000000" style="text-align: left; color:#ffffff; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
                <td width="75" style="padding-left: 10px; padding-right: 5px;">Cat Id</td>
                <td width="125">Category Name</td>
                <td width="197">Category Desc</td>
                <td width="155">Assigned</td>
                <td width="50">Added</td>
                <td width="18"></td>
                <td width="18"></td>
                <td width="18"></td>
                <td width="18"></td>
                <td width="18"></td>
              </tr>
              <cfset rC = 0>
              <!--- loop through results --->
              <cfloop query="qGetCats">
                <!--- query userbase for this members information --->
                <cfquery name="qGetMember" datasource="#ds#" username="#un#" password="#pw#">
				SELECT * FROM a_userbase WHERE uuid = '#qGetCats.uuid#'
				</cfquery>
                <!--- the following code simply flip-flops a flag from 0 to 1 and back --->
                <!--- depending on the current state of the flag (1 or 0) determines --->
                <!--- the color used for the background of the row --->
                <!--- if the current state of the flag is 0 --->
                <cfif rC EQ 0>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "#firstRow#">
                  <!--- set the state of the flag to 1 (for next pass) --->
                  <cfset rC = 1>
                  <!--- otherwise... --->
                  <cfelse>
                  <!--- set the row color (rowC) variable to this color --->
                  <cfset rowC = "#secRow#">
                  <!--- set the state of the flag to 0 (for next pass) --->
                  <cfset rC = 0>
                  <!--- fin --->
                </cfif>
                <!--- wrap the table row in a cfoutput and use the rowC variable to set --->
                <!--- the background color --->
                <tr height="30" style="width: 661px; background-color:#<cfoutput>#rowC#</cfoutput>">
                  <td width="75" height="30" style="padding-left: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000; "><cfoutput>#qGetCats.categoryId#</cfoutput></td>
                  <td width="125" height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;"><cfoutput>#Decrypt(qGetCats.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td width="197" height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;"><cfoutput>#Decrypt(qGetCats.categoryDesc,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td width="155" height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;"><cfoutput>#Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td width="50" height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;"><cfoutput>#DateFormat(qGetCats.addedOn,'mm/dd/yy')#</cfoutput></td>
                  <td width="18"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="editCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/editIcon.gif" alt="Edit Category" width="13" height="13" border="0"/></a></cfoutput>
                      <cfelse>
                      <img src="../images/noEditIcon.gif" border="0" />
                    </cfif>
                  </td>
                  <td width="18"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="archiveCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/archivedIcon.gif" alt="Archive Category" width="13" height="13" border="0" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/noArchivedIcon.gif" border="0"  />
                    </cfif>
                  </td>
                  <td width="18"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="planCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/planCategoryIcon.gif" alt="Schedule Category" width="13" height="13" border="0" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/noPlanIcon.gif" border="0" />
                    </cfif>
                  </td>
                  <td width="18"><cfoutput> <a href="dropCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/deleteIcon.gif" alt="Delete Category" width="13" height="13" border="0" /></a> </cfoutput> </td>
                  <td width="18"><cfoutput> <a href="showCategoryLogs.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/logsIcon.gif" alt="Show Logs" width="13" height="13" border="0" /> </a> </cfoutput> </td>
                </tr>
              </cfloop>
            </table></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/newCategoryButton.gif" alt="newCategory" width="140" height="47" border="0"/></a> <a href="mainMenu.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
