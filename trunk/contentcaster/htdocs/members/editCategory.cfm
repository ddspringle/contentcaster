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
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get members to assign --->
<cfquery name="qGetMembers" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_userbase ORDER BY lastName, firstName
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Edit Category">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
        <tr>
          <td colspan="3"><img src="../images/editCategoryBoxTitle.gif" alt="Edit Category" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"> Use the following form to edit your category and re-assign it to a user or admin to manage. The categoryId CANNOT be changed once created. If you wish to change the categoryId you must drop this category and add a new one. The category name is a human readable title for your category, visible on the website. Description is optional but provides additional information about the category to website visitors. <br />
            <br />
            <form id="form1" name="form1" method="post" action="updateCategory.cfm">
              <!--- include the ucid as a hidden and encrypted value --->
              <!--- taken from the passed ucid value on the URL --->
              <cfoutput>
                <input type="hidden" name="ucid" value="#URL.z#" style="border: 1px solid ##000000; width: 230px;"/>
              </cfoutput> <span style="padding-left: 16px;">Member</span>
              <select name="uuid" id="uuid" style="border: 1px solid ##000000; width: 300px;">
                <!--- loop through members --->
                <cfloop query="qGetMembers">
                  <cfoutput>
                    <!--- check if this member is the one already assigned --->
                    <!--- to this category --->
                    <cfif qGetCat.uuid EQ qGetMembers.uuid>
                      <!--- if this member is the one, select the option automatically --->
                      <option value="#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#" selected="selected">
                      <!--- otherwise... --->
                      <cfelse>
                      <!--- do not select this option --->
                      </option>
                      <option value="#Encrypt(Encrypt(qGetMembers.uuid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#">
                      <!--- fin --->
                    </cfif>
                    #Decrypt(qGetMembers.lastName,fishkey,'BLOWFISH','HEX')#, #Decrypt(qGetMembers.firstName,fishkey,'BLOWFISH','HEX')# (#Decrypt(qGetMembers.username,fishkey,'BLOWFISH','HEX')#)
								
								
                    
                    </option>
                  </cfoutput>
                </cfloop>
              </select>
              <br />
              <br />
              <span style="padding-left: 21px;">Category ID</span> <cfoutput>
                <input name="categoryId" type="text" id="categoryId" size="18" maxlength="14" value="#qGetCat.categoryId#" disabled="disabled" style="border: 1px solid ##000000; width: 230px;"/>
              </cfoutput> <br />
              <br />
              Category Name <cfoutput>
                <input name="categoryName" type="text" id="categoryName" size="40" value="#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')#" style="border: 1px solid ##000000; width: 230px;"/>
              </cfoutput> <br />
              <br />
              <span style="vertical-align:top; padding-left: 5px;">Category Desc </span> <cfoutput>
                <textarea name="categoryDesc" cols="40" rows="3" id="categoryDesc" style="border: 1px solid ##000000; width: 230px;">#Decrypt(qGetCat.categoryDesc,fishkey,'BLOWFISH','HEX')#</textarea>
              </cfoutput> <br />
              <br />
              <input src="../images/changeButton.gif" type="image" name="Submit" value="Update" style="padding-left: 70px;"/>
            </form></td>
          <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <a href="createCategory.cfm" style="padding-left:40px;"><img src="../images/newCategoryButton.gif" alt="New Category" width="140" height="47" border="0" /></a><a href="listCategories.cfm" style="padding-left: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a><br />
    </td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
</body>
</html>
