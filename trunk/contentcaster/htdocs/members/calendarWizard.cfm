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
<cfparam name="URL.d" default="#DateFormat(Now(),'yyyy-mm-dd')#">
<cfparam name="URL.rc" default="">
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
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Schedule Category">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<style type="text/css">
.cal {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:10px; 
text-align:right
}
.calAvail {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
color:#000000;
text-align:right;
background-color:#00FF00
}
.calTaken {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
color:#FFFFFF;
font-weight:bold;
text-align:right;
background-color:#FF6600;
border: 1px solid #000000;
}
.calHeader {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:12px; 
color:#0000FF;
font-weight:bold;
text-align:center
}
</style>
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741" bgcolor="#CCCCCC">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td bgcolor="##0091B5" style="padding-top:10px;"><cfif URL.rc NEQ "">
        <span style="padding-left:40px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight:bold;"><cfoutput>#URL.rc#</cfoutput> days were modified during the last update.</span> <br />
        <br />
        <br />
      </cfif>
      <form action="updateCalendar.cfm" method="post" style="background-color:##0091B5;">
        <cfoutput>
          <input type="hidden" name="ucid" value="#URL.z#" />
          <input type="hidden" name="xDate" value="#DateFormat(URL.d,'yyyy-mm-dd')#" />
        </cfoutput>
        <table cellpadding="0" cellspacing="0" border="0" align="center" width="667" bgcolor="#0091B5">
        <tr>
          <td colspan="3"><img src="../images/calendarWizardTitle.gif" alt="Calendar Wizard" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif" width="6"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td bgcolor="##0091B5" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10pt; color: ##000000;"><cfinvoke component="largeCalendar" method="largeCalendar" returnvariable="foo" ucid="#newZ#" cDate="#DateFormat(URL.d,'yyyy-mm-dd')#"> <cfoutput>
              <div style="background-color:##0091B5;"> <br />
                <br />
                <input type="image" src="../images/scheduleButton.gif" name="submit" value="Schedule #DateFormat(URL.d,'MMMMMM')#" />
              </div>
            </cfoutput> </td>
        </tr>
      </form></td>
    <td background="../images/newUserBox_right.gif" width="3"><img src="../images/newUserBox_right.gif" /></td>
  </tr>
  <tr>
    <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
  </tr>
</table>
<br />
<br />
<cfoutput><a href="planCategory.cfm?z=#URL.z#" style="padding-left:40px;"><img src="../images/plannerButton.gif" alt="Plan Category" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm" style="padding-left: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a><br />
</td>
<td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
</tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
