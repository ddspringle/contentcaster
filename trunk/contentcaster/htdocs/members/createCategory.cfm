<!--- validate session --->
<cfparam name="COOKIE.ccast_sessionId" default="">
<cfparam name="URL.err" default="">
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
  <cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
  <cfelse>
  <!--- get only the current member (currently logged in user) to assign --->
  <cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase WHERE uuid = '#auth[1]#' ORDER BY lastName, firstName 
</cfquery>
</cfif>
<!--- set params --->
<cfparam name="URL.type" default="active">
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Create Category">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/newCategoryBoxTitle.gif" alt="New Category" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><cfif errorText NEQ "">
              <div style="background-color:#FFFFFF; color:#FF0000; font-weight:bold; padding:5px;"><cfoutput>#errorText#</cfoutput></div>
              <br />
            </cfif>
            Use the following form to create a new category
            <cfif level EQ "admin">
              and assign it to a user or admin
            </cfif>
            to manage. The categoryId will be used with the API (i.e. contentCaster.cfm?categoryId=&lt;categoryId&gt; and should contain no spaces. The category name is a human readable title for your category, visible on the website. Description is optional but provides additional information about the category to website visitors. <br />
            <br />
            <form id="form1" name="form1" method="post" action="addNewCategory.cfm">
              <table>
                <tr>
                  <td width="225" class="boldText">Member:</td>
                  <td width="480"><select name="uuid" class="footerText" id="uuid" style="border: 1px solid #000000; width: 400px;">
                      <cfloop query="qGetMembers">
                        <cfoutput>
                          <option value="#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#">#Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')# (#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#)</option>
                        </cfoutput>
                      </cfloop>
                    </select></td>
                </tr>
                <tr>
                  <td class="boldText">Category ID:</td>
                  <td><input name="categoryId" type="text" class="footerText" id="categoryId" style="border: 1px solid #000000; width: 230px;" size="18" maxlength="14"/></td>
                </tr>
                <tr>
                  <td class="boldText">Category Name:</td>
                  <td><input name="categoryName" type="text" class="footerText" id="categoryName" style="border: 1px solid #000000; width: 230px;" value="<cfoutput>#URL.a#</cfoutput>" size="40"/></td>
                </tr>
                <tr>
                  <td class="boldText">Category Desc:</td>
                  <td><textarea name="categoryDesc" cols="40" rows="3" class="footerText" id="categoryDesc" style="border: 1px solid #000000; width: 230px;"><cfoutput>#URL.b#</cfoutput></textarea></td>
                </tr>
                <tr>
                  <td colspan="2"><input src="../images/addButton.gif" type="image" name="Submit" value="Submit" style="padding-left: 70px;"/></td>
                </tr>
              </table>
            </form></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
        <tr>
          <td colspan="3" height="30"></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/catListBoxTitle.gif" alt="Category List" width="673" height="55" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td width="661"><table width="661" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="10" bgcolor="#00FFFF" height="20"><span style="padding-top: 4px; padding-bottom: 4px; padding-left: 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color: #000000; text-decoration: none;">
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
                    <a href="createCategory.cfm?type=all" style="color: #000000; text-decoration:none;"><strong>List All Categories</strong></a>
                    <cfelse>
                    <a href="createCategory.cfm?type=all" style="color: #000000; text-decoration:none;">List All Categories</a>
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
                    <a href="createCategory.cfm?type=archived" style="color: #000000; text-decoration:none;"><strong>List Only Archived</strong></a>
                    <cfelse>
                    <a href="createCategory.cfm?type=archived" style="color: #000000; text-decoration:none;">List Only Archived</a>
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
                    <a href="createCategory.cfm?type=active" style="color: #000000; text-decoration:none;"><strong>Active Categories Only</strong></a>
                    <cfelse>
                    <a href="createCategory.cfm?type=active" style="color: #000000; text-decoration:none;">Active Categories Only</a>
                  </cfif>
                  </span> <br />
                </td>
              </tr>
              <tr>
                <td height="2" colspan="10" bgcolor="#0091B5"></td>
              </tr>
              <tr height="20" bgcolor="#000000" style="text-align: left; color:#ffffff; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold;">
                <td style="padding-left: 10px;" width="60">Cat Id</td>
                <td width="140">Category Name</td>
                <td width="192">Category Desc</td>
                <td width="160">Assigned</td>
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
                  <td height="30" style="padding-left: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000; "><cfoutput>#qGetCats.categoryId#</cfoutput></td>
                  <td height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;" ><cfoutput>#Decrypt(qGetCats.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;" ><cfoutput>#Decrypt(qGetCats.categoryDesc,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;" ><cfoutput>#Decrypt(qGetMember.username,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
                  <td height="30" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size:8pt; color:#000000;" ><cfoutput>#DateFormat(qGetCats.addedOn,'mm/dd/yy')#</cfoutput></td>
                  <td width="18"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="editCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/editIcon.gif" border="0"/></a></cfoutput>
                      <cfelse>
                      <img src="../images/noEditIcon.gif" border="0" />
                    </cfif>
                  </td>
                  <td width="18"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="archiveCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/archivedIcon.gif" border="0" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/noArchivedIcon.gif" border="0"  />
                    </cfif>
                  </td>
                  <td width="18"><cfif qGetCats.archived EQ 0>
                      <cfoutput><a href="planCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/planCategoryIcon.gif" border="0" /></a></cfoutput>
                      <cfelse>
                      <img src="../images/noPlanIcon.gif" border="0" />
                    </cfif>
                  </td>
                  <td width="18"><cfoutput> <a href="dropCategory.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/deleteIcon.gif" border="0" /> </a> </cfoutput> </td>
                  <td width="18"><cfoutput> <a href="showCategoryLogs.cfm?z=#Encrypt(Encrypt(qGetCats.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#"><img src="../images/logsIcon.gif" border="0" /> </a> </cfoutput> </td>
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
      <a href="mainMenu.cfm" style="font-size: 11px; padding-left: 40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" border="0"/></a> </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
