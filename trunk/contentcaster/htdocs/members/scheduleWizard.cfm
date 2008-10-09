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
    <cfelseif URL.err EQ 99>
    <cfset errorText = "You have chosen an ending date that is out of range (i.e. 31 days in a month that has only 30). Please try again.">
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
<!--- get content data for category --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#' ORDER BY contentId
</cfquery>
<!--- get reverse content data for category --->
<cfquery name="qGetSeqRev" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#' ORDER BY contentId DESC
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Schedule Wizard">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
    <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
    <td  bgcolor="#CCCCCC" style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" align="center" width="667">
        <tr>
          <td colspan="3"><img src="../images/scheduleWizardTitle.gif" alt="Schedule Wizard" width="673" height="54" /></td>
        </tr>
        <tr>
          <td background="../images/newUserBox_left.gif" width="6"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
          <td class="textTable" width="655"><cfif errorText NEQ "">
              <div style="background-color:#FFFFFF; color:#FF0000; font-weight:bold; padding:5px;"><cfoutput>#errorText#</cfoutput></div>
              <br />
            </cfif>
            <p>Schedule By Start Date and End Date, Content</p>
            <form action="updateSchedule.cfm" method="post" name="scheduleCategory" id="scheduleCategory">
              <cfoutput>
                <input type="hidden" name="ucid" value="#URL.z#" />
              </cfoutput> <span style="padding-left: 36px;">Start Date</span>
              <input name="sbdStartDate" type="text" id="sbdStartDate" value="mm/dd/yyyy" size="12" maxlength="10" style="border: 1px solid #000000; width: 210px;" />
              <br />
              <br />
              <span style="padding-left: 41px;">End Date</span>
              <input name="sbdEndDate" type="text" id="sdbEndDate" value="mm/dd/yyyy" size="12" maxlength="10" style="border: 1px solid #000000; width: 210px;" />
              <br />
              <br />
              <span style="padding-left: 5px;">Start Content</span>
              <select name="sbdStartSeq" id="sbdStartSeq" style="border: 1px solid #000000;">
                <cfloop query="qGetContent">
                  <cfoutput>
                    <option value="#qGetContent.contentId#">#qGetContent.contentId#</option>
                  </cfoutput>
                </cfloop>
              </select>
              <br />
              <br />
              <input name="Submit" type="submit" id="Submit" value="Schedule By Date" />
              <br />
              <br />
              <br />
              Schedule By Start Content and End Content, Start Date <br />
              <br />
              <span style="padding-left: 5px;">Start Content</span>
              <select name="sbsStartSeq" id="sbsStartSeq" style="border: 1px solid #000000;">
                <cfloop query="qGetContent">
                  <cfoutput>
                    <option value="#qGetContent.contentId#">#qGetContent.contentId#</option>
                  </cfoutput>
                </cfloop>
              </select>
              <br />
              <br />
              <span style="padding-left: 10px;">End Content</span>
              <select name="sbsEndSeq" id="sbsEndSeq" style="border: 1px solid #000000;">
                <cfloop query="qGetSeqRev">
                  <cfoutput>
                    <option value="#qGetSeqRev.contentId#">#qGetSeqRev.contentId#</option>
                  </cfoutput>
                </cfloop>
              </select>
              <br />
              <br />
              <span style="padding-left: 36px;">Start Date</span>
              <input name="sbsStartDate" type="text" id="sbsStartDate" value="mm/dd/yyyy" size="12" maxlength="10" style="border: 1px solid #000000; width: 210px;" />
              <br />
              <br />
              <input name="Submit" type="submit" id="Submit" value="Schedule By Content" />
              <br />
              <br />
              <br />
              Rotation Scheduling<br />
              <br />
              <span style="padding-left: 36px;">Start Date</span>
              <input name="rotStartDate" type="text" id="rotStartDate" value="mm/dd/yyyy" size="12" maxlength="10" style="border: 1px solid #000000; width: 210px;" />
              <br />
              <br />
              <span style="padding-left: 41px;">End Date</span>
              <input name="rotEndDate" type="text" id="rotEndDate" value="mm/dd/yyyy" size="12" maxlength="10" style="border: 1px solid #000000; width: 210px;" />
              <br />
              <br />
              <span style="padding-left: 5px;">Start Content</span>
              <select name="rotStartSeq" id="rotStartSeq" style="border: 1px solid #000000;">
                <cfloop query="qGetContent">
                  <cfoutput>
                    <option value="#qGetContent.contentId#">#qGetContent.contentId#</option>
                  </cfoutput>
                </cfloop>
              </select>
              <br />
              <br />
              <span style="padding-left: 10px;">End Content</span>
              <select name="rotEndSeq" id="rotEndSeq" style="border: 1px solid #000000;">
                <cfloop query="qGetSeqRev">
                  <cfoutput>
                    <option value="#qGetSeqRev.contentId#">#qGetSeqRev.contentId#</option>
                  </cfoutput>
                </cfloop>
              </select>
              <br />
              <br />
              <input name="Submit" type="submit" id="Submit" value="Configure Rotation" />
            </form></td>
          <td background="../images/newUserBox_right.gif" width="3"><img src="../images/newUserBox_right.gif" /></td>
        </tr>
        <tr>
          <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
        </tr>
      </table>
      <br />
      <br />
      <cfoutput><a href="planCategory.cfm?z=#URL.z#" style="padding-left:40px;"><img src="../images/plannerButton.gif" alt="Plan Category" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm" style="padding-left: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="padding-left: 20px;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
</p>
