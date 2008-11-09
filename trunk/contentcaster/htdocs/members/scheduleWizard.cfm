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
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- get content data for category --->
<cfquery name="qGetContent" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#' ORDER BY contentId
</cfquery>
<!--- get reverse content data for category --->
<cfquery name="qGetSeqRev" datasource="#ds#" username="#un#" password="#pw#" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
SELECT * FROM a_contentbase WHERE ucid = '#newZ#' ORDER BY contentId DESC
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Schedule Wizard">
<!--- include the header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<table cellpadding="0" cellspacing="0" border="0" class="bodyTable">
  <tr>
    <td class="bodyLeft">&nbsp;</td>
    <td style="padding-top:10px;"><table cellpadding="0" cellspacing="0" border="0" class="newUserTable">
        <tr>
          <td colspan="3"><img src="../images/scheduleWizardTitle.gif" alt="Schedule Wizard" width="673" height="54" /></td>
        </tr>
        <tr>
          <td class="newUserLeft">&nbsp;</td>
          <td class="textTableCenter"><form action="updateSchedule.cfm" method="post" name="scheduleCategory" id="scheduleCategory">
              <cfif errorText NEQ "">
                <div class="loginError"><cfoutput>#errorText#</cfoutput></div>
                <br />
              </cfif>
              <table class="borderTable">
                <tr>
                  <td class="headingText">Schedule By Start Date and End Date, Content</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td class="boldText">Start Date<cfoutput>
                      <input type="hidden" name="ucid" value="#URL.z#" />
                    </cfoutput></td>
                </tr>
                <tr>
                  <td><input name="sbdStartDate" type="text" id="sbdStartDate" value="mm/dd/yyyy" size="12" maxlength="10" style="width: 210px;" class="fieldBorder" /></td>
                </tr>
                <tr>
                  <td class="boldText">End Date</td>
                </tr>
                <tr>
                  <td><input name="sbdEndDate" type="text" id="sdbEndDate" value="mm/dd/yyyy" size="12" maxlength="10" style="width: 210px;" class="fieldBorder" /></td>
                </tr>
                <tr>
                  <td class="boldText">Start Content</td>
                </tr>
                <tr>
                  <td><select name="sbdStartSeq" id="sbdStartSeq" class="fieldBorder">
                      <cfloop query="qGetContent">
                        <cfoutput>
                          <option value="#qGetContent.contentId#">#qGetContent.contentId#</option>
                        </cfoutput>
                      </cfloop>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><input name="Submit" type="submit" id="btnSchedDate" value="Schedule By Date" /></td>
                </tr>
              </table>
              <br />
              <br />
              <table class="borderTable">
                <tr>
                  <td class="headingText">Schedule By Start Content and End Content, Start Date</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td class="boldText">Start Content</td>
                </tr>
                <tr>
                  <td><select name="sbsStartSeq" id="sbsStartSeq" class="fieldBorder">
                      <cfloop query="qGetContent">
                        <cfoutput>
                          <option value="#qGetContent.contentId#">#qGetContent.contentId#</option>
                        </cfoutput>
                      </cfloop>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="boldText">End Content</td>
                </tr>
                <tr>
                  <td><select name="sbsEndSeq" id="sbsEndSeq" class="fieldBorder">
                      <cfloop query="qGetSeqRev">
                        <cfoutput>
                          <option value="#qGetSeqRev.contentId#">#qGetSeqRev.contentId#</option>
                        </cfoutput>
                      </cfloop>
                    </select></td>
                </tr>
                <tr>
                  <td class="boldText">Start Date</td>
                </tr>
                <tr>
                  <td><input name="sbsStartDate" type="text" id="sbsStartDate" value="mm/dd/yyyy" size="12" maxlength="10" style="width: 210px;" class="fieldBorder" /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><input name="Submit" type="submit" id="btnSchedContent" value="Schedule By Content" /></td>
                </tr>
              </table>
              <br />
              <br />
              <table class="borderTable">
                <tr>
                  <td class="headingText">Rotation Scheduling</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td class="boldText">Start Date</td>
                </tr>
                <tr>
                  <td><input name="rotStartDate" type="text" id="rotStartDate" value="mm/dd/yyyy" size="12" maxlength="10" style="width: 210px;" class="fieldBorder" /></td>
                </tr>
                <tr>
                  <td class="boldText">End Date</td>
                </tr>
                <tr>
                  <td><input name="rotEndDate" type="text" id="rotEndDate" value="mm/dd/yyyy" size="12" maxlength="10" style="width: 210px;" class="fieldBorder" /></td>
                </tr>
                <tr>
                  <td class="boldText">Start Content</td>
                </tr>
                <tr>
                  <td><select name="rotStartSeq" id="rotStartSeq" class="fieldBorder">
                      <cfloop query="qGetContent">
                        <cfoutput>
                          <option value="#qGetContent.contentId#">#qGetContent.contentId#</option>
                        </cfoutput>
                      </cfloop>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td class="boldText">End Content</td>
                </tr>
                <tr>
                  <td><select name="rotEndSeq" id="rotEndSeq" class="fieldBorder">
                      <cfloop query="qGetSeqRev">
                        <cfoutput>
                          <option value="#qGetSeqRev.contentId#">#qGetSeqRev.contentId#</option>
                        </cfoutput>
                      </cfloop>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><input name="Submit" type="submit" id="btnConfigRotation" value="Configure Rotation" /></td>
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
    <td class="navStyle"><cfoutput><a href="planCategory.cfm?z=#URL.z#"><img src="../images/plannerButton.gif" alt="Plan Category" width="140" height="47" border="0" /></a></cfoutput><a href="listCategories.cfm"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0" /></a></td>
    <td class="bodyRight">&nbsp;</td>
  </tr>
</table>
<!--- include the footer template --->
<cfinclude template="../includes/footer.cfm">
