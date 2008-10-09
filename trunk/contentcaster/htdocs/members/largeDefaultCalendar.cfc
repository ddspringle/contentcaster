<cfcomponent>
<cffunction name="largeDefaultCalendar" access="public" returntype="string" output="true">
  <cfargument name="ucid" type="string" required="yes">
  <cfargument name="cDate" type="string" required="yes">
  <cfinclude template="../Application.cfm">
  <cfset iDate = CreateDate(DateFormat(ARGUMENTS.cDate,'yyyy'), DateFormat(ARGUMENTS.cDate,'mm'), 1)>
  <cfset begin = DayOfWeek(iDate)>
  <cfset end = DaysInMonth(iDate)>
  <cfoutput>
    <table width="661" cellspacing="2" cellpadding="2" bgcolor="##0091B5">
    <tr>
      <td><center>
          <div style="width:20px; height: 20px; background-color: ##ff6600; border: 1px solid ##000000; text-align: center;"> <a href="defaultCalendarWizard.cfm?z=#Encrypt(Encrypt(ARGUMENTS.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#&d=#DateFormat(DateAdd('m',-1,iDate),'yyyy-mm-dd')#" style="color: ##ffffff; font-weight: bold; text-decoration: none; font-size: 14pt;"> &lt; </a> </div>
        </center></td>
      <td colspan="5" align="center" style="font-size: 16pt; font-weight: bold; color: ##000000; font-familly: Arial, Helvetica;">#DateFormat(iDate,'MMMM YYYY')#</td>
      <td style="text-align:right;"><center>
        <div style="width:20px; height: 20px; background-color: ##ff6600; border: 1px solid ##000000; text-align: center;"> <a href="defaultCalendarWizard.cfm?z=#Encrypt(Encrypt(ARGUMENTS.ucid,fishkey,'BLOWFISH','BASE64'),fishkey,'BLOWFISH','HEX')#&d=#DateFormat(DateAdd('m',1,iDate),'yyyy-mm-dd')#" style="color: ##ffffff; font-weight: bold; text-decoration: none;font-size: 14pt;"> &gt; </a> </div></td>
    </tr>
    <tr>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Sun</td>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Mon</td>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Tue</td>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Wed</td>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Thu</td>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Fri</td>
      <td width="89" style="font-size:10pt; font-weight: bold;" align="center">Sat</td>
    </tr>
    <tr>
  </cfoutput>
  <cfquery name="qGetSched" datasource="#ds#" username="#un#" password="#pw#">
						  SELECT * FROM a_defaultcategoryschedule
						  </cfquery>
  <cfquery name="qGetCats" datasource="#ds#" username="#un#" password="#pw#">
						  SELECT * FROM a_categorybase WHERE archived = 0 ORDER BY categoryId
						  </cfquery>
  <cfif begin EQ 1>
    <cfoutput>
      <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
							  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',4,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',5,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',5,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',5,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',6,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',6,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',6,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 7>
    <cfelseif begin EQ 2>
    <cfoutput>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',4,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',5,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',5,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',5,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 6>
    <cfelseif begin EQ 3>
    <cfoutput>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',4,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',4,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 5>
    <cfelseif begin EQ 4>
    <cfoutput>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',3,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',3,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 4>
    <cfelseif begin EQ 5>
    <cfoutput>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',2,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',2,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 3>
    <cfelseif begin EQ 6>
    <cfoutput>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 2>
    <cfelseif begin EQ 7>
    <cfoutput>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <td width="89" height="100" class="cal">&nbsp;</td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(iDate,'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(iDate,'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(iDate,'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </cfoutput>
    <cfset nn = 1>
  </cfif>
  <cfoutput>
    </tr>
    <tr class="cal">
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+1,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+1,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+1,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+2,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+2,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+2,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+3,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+3,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+3,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+4,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+4,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+4,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+5,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+5,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+5,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+6,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+6,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+6,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </tr>
    <tr class="cal">
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+7,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+7,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+7,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+8,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+8,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+8,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+9,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+9,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+9,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+10,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+10,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+10,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+11,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+11,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+11,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+12,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+12,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+12,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+13,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+13,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+13,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </tr>
    <tr class="cal">
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+14,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+14,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+14,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+15,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+15,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+15,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+16,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+16,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+16,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+17,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+17,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+17,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+18,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+18,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+18,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+19,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+19,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+19,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
      <cfquery name="qCheckDate" dbtype="query">
						  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+20,iDate),'yyyy-mm-dd')#'
						  </cfquery>
      <cfif qCheckDate.RecordCount EQ 0>
        <cfset class="calAvail">
        <cfelse>
        <cfset class="calTaken">
      </cfif>
      <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+20,iDate),'dd')#<br />
        <br />
        <br />
        <br />
        <cfoutput>
          <select name="#DateFormat(DateAdd('d',nn+20,iDate),'yyyy-mm-dd')#">
        </cfoutput>
        <option value="">-</option>
        <cfloop query="qGetCats">
          <cfoutput>
            <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
          </cfoutput>
        </cfloop>
        </select></td>
    </tr>
  </cfoutput>
  <cfif begin EQ 7>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
          </tr>
        </cfoutput>
        <cfelse>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
      </cfif>
      <cfelse>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
        </tr>
      </cfoutput>
    </cfif>
    <cfif end EQ 30>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+28,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
      <cfelseif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+28,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+29,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+29,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+29,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
    </cfif>
    <cfelseif begin EQ 6>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
        <cfelse>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
      </cfif>
      <cfelse>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
        </tr>
      </cfoutput>
    </cfif>
    <cfif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+28,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+28,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
          <td width="89"  height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
    </cfif>
    <cfelseif begin EQ 5>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
        <cfelse>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
      </cfif>
      <cfelseif end EQ 30>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
      <cfelseif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+27,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+27,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
        </tr>
      </cfoutput>
    </cfif>
    <cfelseif begin EQ 4>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
        <cfelse>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
      </cfif>
      <cfelseif end EQ 30>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
      <cfelseif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+26,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+26,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
    </cfif>
    <cfelseif begin EQ 3>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
        <cfelse>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
      </cfif>
      <cfelseif end EQ 30>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
      <cfelseif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+25,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+25,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
    </cfif>
    <cfelseif begin EQ 2>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
        <cfelse>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
      </cfif>
      <cfelseif end EQ 30>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
      <cfelseif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+24,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+24,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
    </cfif>
    <cfelseif begin EQ 1>
    <cfif end LT 30>
      <cfif IsLeapYear(Year(iDate))>
        <cfoutput>
          <tr class="cal">
            <cfquery name="qCheckDate" dbtype="query">
								SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
								</cfquery>
            <cfif qCheckDate.RecordCount EQ 0>
              <cfset class="calAvail">
              <cfelse>
              <cfset class="calTaken">
            </cfif>
            <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
              <br />
              <cfoutput>
                <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
              </cfoutput>
              <option value="">-</option>
              <cfloop query="qGetCats">
                <cfoutput>
                  <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
                </cfoutput>
              </cfloop>
              </select></td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
            <td width="89" height="100" class="cal">&nbsp;</td>
          </tr>
        </cfoutput>
        <cfelse>
      </cfif>
      <cfelseif end EQ 30>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
      <cfelseif end EQ 31>
      <cfoutput>
        <tr class="cal">
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+21,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+21,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+22,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+22,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <cfquery name="qCheckDate" dbtype="query">
							  SELECT runDate, ucid FROM qGetSched WHERE runDate = '#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#'
							  </cfquery>
          <cfif qCheckDate.RecordCount EQ 0>
            <cfset class="calAvail">
            <cfelse>
            <cfset class="calTaken">
          </cfif>
          <td width="89" height="100" class="#class#">#DateFormat(DateAdd('d',nn+23,iDate),'dd')#<br />
            <br />
            <br />
            <br />
            <cfoutput>
              <select name="#DateFormat(DateAdd('d',nn+23,iDate),'yyyy-mm-dd')#">
            </cfoutput>
            <option value="">-</option>
            <cfloop query="qGetCats">
              <cfoutput>
                <option value="#qGetCats.ucid#" <cfif qCheckDate.ucid EQ qGetCats.ucid>selected="selected"</cfif>>#Left(qGetCats.categoryId,8)#</option>
              </cfoutput>
            </cfloop>
            </select></td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
          <td width="89" height="100" class="cal">&nbsp;</td>
        </tr>
      </cfoutput>
    </cfif>
  </cfif>
  </table>
</cffunction>
</cfcomponent>
