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
<!--- get category data --->
<cfquery name="qGetCat" datasource="#ds#" username="#un#" password="#pw#">
SELECT * FROM a_categorybase WHERE ucid = '#newZ#'
</cfquery>
<!--- HTML --->
<!--- set page <title> tag with pageName variable --->
<cfset pageName = "Schedule Category">
<!--- include the appropriate header template --->
<cfinclude template="../includes/header.cfm">
<!--- BODY --->
<style>
.cal {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:10px; 
text-align:right
}
.calAvail {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
color:#000000;
text-align:center;
background-color:#00FF00;
padding-top: 2px;
padding-bottom: 2px;
height: 10px;
width:14px;
border: 1px solid #000000;
}
.calTaken {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
color:#000000;
font-weight:bold;
text-align:center;
background-color:#FF6600;
height: 10px;
width: 14px;
padding-top: 2px;
padding-bottom: 2px;
border: 1px solid #000000;
}
.calHeader {
font-family:Verdana, Verdana, Arial, Helvetica, sans-serif;
font-size:18px; 
color:#000000;
font-weight:bold;
text-align:left;
padding-bottom: 15px;
}
</style>
<table cellpadding="0" cellspacing="0" border="0" align="center" class="bodyTable" width="741">
  <tr>
  
  <td background="../images/bodySpacer_left.gif"><img src="../images/bodySpacer_left.gif" width="3"/></td>
  <td  bgcolor="#CCCCCC" style="padding-top:10px;">
  
  <table cellpadding="0" cellspacing="0" border="0" align="center" width="673">
    <tr>
      <td colspan="3"><img src="../images/plannerTitle.gif" /></td>
    <tr>
    
    <td background="../images/newUserBox_left.gif"><img src="../images/newUserBox_left.gif" width="6" height="1" /></td>
    <td class="textTable" width="667">
    
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" class="calHeader">Category Title: <cfoutput>#Decrypt(qGetCat.categoryName,fishkey,'BLOWFISH','HEX')#</cfoutput></td>
      </tr>
    </table>
    <table width="621" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="top"><!-- Left Column -->
          <table cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td style="padding-bottom: 5px;">Planning</td>
            </tr>
            <tr>
              <td valign="top"><cfoutput>
                  <table width="225" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><a href="scheduleWizard.cfm?z=#URL.z#"><img src="../images/scheduleWizardButton.gif" border="0" alt="Schedule Wizard" /></a></td>
                    </tr>
                    <tr>
                      <td height="10"></td>
                    </tr>
                    <tr>
                      <td><a href="calendarWizard.cfm?z=#URL.z#"><img src="../images/calendarWizardButton.gif" border="0" alt="Calendar Wizard" /></a> </td>
                    </tr>
                  </table>
                </cfoutput> </td>
            </tr>
            <tr>
              <td style="padding-top: 40px; padding-bottom: 5px;">Content Management</td>
            </tr>
            <tr>
              <td valign="top"><cfoutput>
                  <table width="225" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><a href="uploadContent.cfm?z=#URL.z#"><img src="../images/uploadContentButton.gif" border="0" alt="Upload Content" /></a></td>
                    </tr>
                    <tr>
                      <td height="10"></td>
                    </tr>
                    <tr>
                      <td><a href="listContent.cfm?z=#URL.z#"><img src="../images/manageContentButton.gif" border="0" alt="Manage Content" /></a> </td>
                    </tr>
                  </table>
                </cfoutput> </td>
            </tr>
          </table>
          <!-- End Left Column -->
        </td>
        <td></td>
        <!-- Right Column -->
        <td valign="top">
        <table cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td style="text-align:center; padding-bottom: 10px; font-weight:bold;">Quick View Calendar </td>
          </tr>
          <tr>
          
          <td align="center" style="padding-bottom: 10px;">
          
          <div>
          
          <cfset iDate = CreateDate(DateFormat(Now(),'yyyy'), DateFormat(Now(),'mm'), 1)>
          <cfset begin = DayOfWeek(iDate)>
          <cfset end = DaysInMonth(iDate)>
          <cfoutput>
            <form>
              <input type="hidden" name="random" value="#RandRange(1,1000000)#" />
            </form>
            <table width="100" border="0" cellspacing="4" cellpadding="4" style="border: 1px solid ##000000;">
            
            <tr>
              <td colspan="7" align="center" style="font-weight:bold; font-size: 12pt;">#DateFormat(iDate,'MMMM YYYY')#</td>
            </tr>
            <tr>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Sun</td>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Mon</td>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Tue</td>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Wed</td>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Thu</td>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Fri</td>
              <td width="10" style="font-size:11px; font-weight:bold;" align="center">Sat</td>
            </tr>
            <tr>
            
          </cfoutput>
          <cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#">
													  SELECT * FROM a_categoryschedule WHERE ucid = '#newZ#'
													  </cfquery>
          <cfif begin EQ 1>
            <cfoutput>
              <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
														  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">
              
              #DateFormat(iDate,'dd')#
              </td>
              
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',4,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',5,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',5,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',6,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',6,iDate),'dd')#</td>
            </cfoutput>
            <cfset nn = 7>
            <cfelseif begin EQ 2>
            <cfoutput>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(iDate,'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',4,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',5,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',5,iDate),'dd')#</td>
            </cfoutput>
            <cfset nn = 6>
            <cfelseif begin EQ 3>
            <cfoutput>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(iDate,'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',4,iDate),'dd')#</td>
            </cfoutput>
            <cfset nn = 5>
            <cfelseif begin EQ 4>
            <cfoutput>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(iDate,'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#</td>
            </cfoutput>
            <cfset nn = 4>
            <cfelseif begin EQ 5>
            <cfoutput>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(iDate,'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#</td>
            </cfoutput>
            <cfset nn = 3>
            <cfelseif begin EQ 6>
            <cfoutput>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(iDate,'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#</td>
            </cfoutput>
            <cfset nn = 2>
            <cfelseif begin EQ 7>
            <cfoutput>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <td width="10" height="10" class="cal">&nbsp;</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(iDate,'dd')#</td>
            </cfoutput>
            <cfset nn = 1>
          </cfif>
          <cfoutput>
            </tr>
            
            <tr class="cal">
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+1,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+1,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+2,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+2,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+3,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+3,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+4,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+4,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+5,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+5,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+6,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+6,iDate),'dd')#</td>
            </tr>
            <tr class="cal">
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+7,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+7,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+8,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+8,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+9,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+9,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+10,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+10,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+11,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+11,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+12,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+12,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+13,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+13,iDate),'dd')#</td>
            </tr>
            <tr class="cal">
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+14,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+14,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+15,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+15,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+16,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+16,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+17,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+17,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+18,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+18,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+19,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+19,iDate),'dd')#</td>
              <cfquery name="qCheckDate" dbtype="query">
													  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+20,iDate),'yyyy-mm-dd')#'
													  </cfquery>
              <cfif qCheckDate.RecordCount EQ 0>
                <cfset class="calAvail">
                <cfelse>
                <cfset class="calTaken">
              </cfif>
              <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+20,iDate),'dd')#</td>
            </tr>
          </cfoutput>
          <cfif begin EQ 7>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#</td>
                  </tr>
                </cfoutput>
                <cfelse>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
              </cfif>
              <cfelse>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif end EQ 30>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+28,iDate),'dd')#</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
              <cfelseif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+28,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+29,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+29,iDate),'dd')#</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfelseif begin EQ 6>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
                <cfelse>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
              </cfif>
              <cfelse>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+28,iDate),'dd')#</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                  <td width="10"  height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfelseif begin EQ 5>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
                <cfelse>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
              </cfif>
              <cfelseif end EQ 30>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
              <cfelseif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfelseif begin EQ 4>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
                <cfelse>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
              </cfif>
              <cfelseif end EQ 30>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
              <cfelseif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfelseif begin EQ 3>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
                <cfelse>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
              </cfif>
              <cfelseif end EQ 30>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
              <cfelseif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfelseif begin EQ 2>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
                <cfelse>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
              </cfif>
              <cfelseif end EQ 30>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
              <cfelseif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
            <cfelseif begin EQ 1>
            <cfif end LT 30>
              <cfif IsLeapYear(Year(iDate))>
                <cfoutput>
                  <tr class="cal">
                    <cfquery name="qCheckDate" dbtype="query">
															SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
															</cfquery>
                    <cfif qCheckDate.RecordCount EQ 0>
                      <cfset class="calAvail">
                      <cfelse>
                      <cfset class="calTaken">
                    </cfif>
                    <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                    <td width="10" height="10" class="cal">&nbsp;</td>
                  </tr>
                </cfoutput>
                <cfelse>
              </cfif>
              <cfelseif end EQ 30>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
              <cfelseif end EQ 31>
              <cfoutput>
                <tr class="cal">
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#</td>
                  <cfquery name="qCheckDate" dbtype="query">
														  SELECT runDate FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
														  </cfquery>
                  <cfif qCheckDate.RecordCount EQ 0>
                    <cfset class="calAvail">
                    <cfelse>
                    <cfset class="calTaken">
                  </cfif>
                  <td width="10" height="10" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                  <td width="10" height="10" class="cal">&nbsp;</td>
                </tr>
              </cfoutput>
            </cfif>
          </cfif>
        </table>
        </div>
      </td>
      
      </tr>
      
      <tr>
        <td align="center"><table border="0" cellspacing="2" cellpadding="2">
            <tr>
              <td class="calAvail">&nbsp;</td>
              <td>This date is available to be scheduled.</td>
            </tr>
            <tr>
              <td class="calTaken">&nbsp;</td>
              <td>This date has already been scheduled.</td>
            </tr>
          </table></td>
      </tr>
    </table>
    </td>
    
    <!-- End Right Column -->
    </tr>
    
  </table>
  </td>
  
  <td background="../images/newUserBox_right.gif"><img src="../images/newUserBox_right.gif" /></td>
  </tr>
  <tr>
    <td colspan="3"><img src="../images/newUserBoxFooter.gif" /></td>
  </tr>
</table>
<br />
<a href="listCategories.cfm" style="padding-left: 40px; padding-right: 20px;"><img src="../images/categoryListButton.gif" alt="Category List" width="140" height="47" border="0" /></a><a href="mainMenu.cfm" style="font-size: 11px; font-family:Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #000000; text-decoration:none;"><img src="../images/mainMenuButton.gif" alt="Main Menu" width="140" height="47" border="0"/></a>
</td>
<td background="../images/bodySpacer_right.gif"><img src="../images/bodySpacer_right.gif" width="4" height="1" /></td>
</tr>
</table>
<!--- include the appropriate footer template --->
<cfinclude template="../includes/footer.cfm">
