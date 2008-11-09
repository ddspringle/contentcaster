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
<cfcomponent>
<cffunction name="calMonth" access="public" returntype="string">
  <cfargument name="calId" type="string" required="yes" hint="I am a unique calendar style id defined in your CSS style sheet.">
  <cfargument name="thisDate" type="date" required="yes" hint="I am a date object of the month you wish to output on the calendar.">
  <cfargument name="dataQuery" type="query" required="yes" hint="I am the data query to present in the calendar (i.e. events).">
  <cfargument name="dateColumn" type="string" required="yes" hint="I am the column name of your query that contains date data.">
  <cfargument name="nameColumn" type="string" required="yes" hint="I am the column name of your query that contain the event name.">
  <cfargument name="showEvents" type="boolean" required="no" default="false" hint="Set me to True to display events in the calendar.">
  <cfargument name="dayFormat" type="numeric" required="no" default="1" hint="Set me to 1 to display days as 'S,M,T...', set me to 3 to display 'Sun,Mon,Tue...'.">
  <cfargument name="eventChars" type="numeric" required="no" default="10" hint="I am the length of characters to show in the event listing.">
  <cfargument name="dateCallback" type="string" required="no" default="" hint="I am the callback script if someone clicks the date in the calendar.">
  <cfargument name="dateCallbackField" type="string" required="no" default="" hint="I am the field name to send back with the callback, i.e. callback.cfm?dateCallbackField=">
  <cfargument name="eventCallback" type="string" required="no" default="" hint="I am the callback script if someone clicks the event in the calendar.">
  <cfargument name="eventCallbackField" type="string" required="no" default="" hint="I am the field name to send back with the callback, i.e. callback.cfm?eventCallbackField=">
  <cfargument name="eventCallbackColumn" type="string" required="no" default="" hint="I am the column of the database to supply the value to the event callback.">
  <cfset thisYear = Year(ARGUMENTS.thisDate)>
  <cfset thisMonth = Month(ARGUMENTS.thisDate)>
  <!--- Create start and end of this month --->
  <cfset startMonth = CreateDateTime(thisYear, thisMonth, 1, 0, 0, 0)>
  <cfset endMonth = CreateDateTime(thisYear, thisMonth, DaysInMonth(startMonth), 23, 59, 59)>
  <!--- query all records in this month --->
  <cfquery name="qGetSched" dbtype="query" cachedwithin="#CreateTimeSpan(0,0,0,30)#">
  SELECT * FROM ARGUMENTS.dataQuery WHERE (#ARGUMENTS.dateColumn# BETWEEN #startMonth# AND #endMonth#)
  </cfquery>
  <!--- Code for calculating the days format to display --->
  <cfset blockOffset = DayOfWeek(startMonth)>
  <cfset endBlock = blockOffset + DaysInMonth(startMonth)-1>
  <cfset calendarDays = (ceiling(endBlock/7))*7>
  <cfset iDay = 1>
  <cfset returnData = '
                  <table border="0" cellpadding="2" cellspacing="0" class="calTable_#ARGUMENTS.calId#">
                    <tr>
                      <td colspan="7" class="calMonthTitle_#ARGUMENTS.calId#">#DateFormat(CreateDate(thisYear,thisMonth,1),'mmmmm yyyy')#</td>
                    </tr>'>
  <cfif ARGUMENTS.dayFormat EQ 1>
    <cfset returnData = returnData & '
                    <tr>
                      <td class="calDayTitle_#ARGUMENTS.calId#">S</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">M</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">T</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">W</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">T</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">F</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">S</td>
                    </tr>
                    <tr>'>
    <cfelse>
    <cfset returnData = returnData & '
                    <tr>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Sun</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Mon</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Tue</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Wed</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Thu</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Fri</td>
                      <td class="calDayTitle_#ARGUMENTS.calId#">Sat</td>
                    </tr>
                    <tr>'>
  </cfif>
  <cfloop from="1" to="#calendarDays#" index="iX">
    <!--- check if this is a calendar day cell --->
    <cfif iX GTE blockOffset AND iX LTE endBlock>
      <!--- Create start and end of this day --->
      <cfset startDay = CreateDateTime(thisYear, thisMonth, iDay, 0, 0, 0)>
      <cfset endDay = CreateDateTime(thisYear, thisMonth, iDay, 23, 59, 59)>
      <!--- it is, check if eventCallbackColumn is defined --->
      <cfif ARGUMENTS.eventCallbackColumn NEQ "">
        <!--- it is, query records for today with callback --->
        <cfquery name="qGetToday" dbtype="query">
	  SELECT #ARGUMENTS.nameColumn#, #ARGUMENTS.eventCallbackColumn# FROM ARGUMENTS.dataQuery WHERE (#ARGUMENTS.dateColumn# BETWEEN '#DateFormat(startDay,'yyyy-mm-dd')# #TimeFormat(startDay,'HH:mm:ss')#' AND '#DateFormat(endDay,'yyyy-mm-dd')# #TimeFormat(endDay,'HH:mm:ss')#')
	  </cfquery>
        <!--- otherwise --->
        <cfelse>
        <!--- query records for today without callback --->
        <cfquery name="qGetToday" dbtype="query">
	  
	  SELECT #ARGUMENTS.nameColumn# FROM ARGUMENTS.dataQuery WHERE (#ARGUMENTS.dateColumn# BETWEEN '#DateFormat(startDay,'yyyy-mm-dd')# #TimeFormat(startDay,'HH:mm:ss')#' AND '#DateFormat(endDay,'yyyy-mm-dd')# #TimeFormat(endDay,'HH:mm:ss')#')
	  </cfquery>
        <!--- end checking for eventCallbackColumn definition --->
      </cfif>
      <!--- check if the current day is today --->
      <cfif iDay IS DatePart("d", Now()) AND Month(startMonth) IS Month(Now())>
        <!--- it is, set the style to today --->
        <cfset calStyle = "calDayToday">
        <!--- otherwise --->
        <cfelse>
        <!--- set the style to other day --->
        <cfset calStyle = "calDay">
        <!--- end checking for current day = today --->
      </cfif>
      <!--- check if any events exist --->
      <cfif qGetToday.RecordCount EQ 0>
        <!--- no events exist, check for the date callback --->
        <cfif ARGUMENTS.dateCallback EQ "">
          <!--- no callback defined --->
          <cfset returnData = returnData & '<td class="#calStyle#Free_#ARGUMENTS.calId#">#iDay#</td>'>
          <!--- otherwise --->
          <cfelse>
          <!--- call back is defined --->
          <cfset returnData = returnData & '<td class="#calStyle#Free_#ARGUMENTS.calId#"><a href="#ARGUMENTS.dateCallback#?#ARGUMENTS.dateCallbackField#=#DateFormat(CreateDate(thisYear,thisMonth,iDay),'yyyy-mm-dd')#" class="calCallbackLink_#ARGUMENTS.calId#">#iDay#</a></td>'>
          <!--- end checking for date callback --->
        </cfif>
        <!--- otherwise --->
        <cfelse>
        <!--- events exist, check for date callback --->
        <cfif ARGUMENTS.dateCallback EQ "">
          <!--- no callback, check for show events flag --->
          <cfif ARGUMENTS.showEvents IS False>
            <!--- no callback, don't show events --->
            <cfset returnData = returnData & '<td class="#calStyle#Taken_#ARGUMENTS.calId#">#iDay#</td>'>
            <!--- otherwise --->
            <cfelse>
            <!--- no callback, but show events --->
            <cfset returnData = returnData & '<td class="#calStyle#Taken_#ARGUMENTS.calId#">#iDay#<br />'>
            <cfloop query="qGetToday">
              <cfset todayVal = qGetToday["#ARGUMENTS.nameColumn#"]>
              <cfif ARGUMENTS.eventCallback EQ "">
                <cfset returnData = returnData & '<table><tr><td class="calEventData_#ARGUMENTS.calId#">#Left(todayVal,ARGUMENTS.eventChars)#</td></tr></table>'>
                <cfelse>
                <cfset callbackValue = qGetToday["#ARGUMENTS.eventCallbackColumn#"]>
                <cfset returnData = returnData & '<table><tr><td class="calEventData_#ARGUMENTS.calId#"><a href="#ARGUMENTS.eventCallback#?#ARGUMENTS.eventCallbackField#=#callbackValue#&amp;#ARGUMENTS.dateCallbackField#=#DateFormat(CreateDate(thisYear,thisMonth,iDay),'yyyy-mm-dd')#" class="calEventCallbackLink_#ARGUMENTS.calId#">#Left(todayVal,ARGUMENTS.eventChars)#</a></td></tr></table>'>
              </cfif>
            </cfloop>
            <cfset returnData = returnData & '</td>'>
            <!--- end checking for show events flag --->
          </cfif>
          <!--- otherwise --->
          <cfelse>
          <!--- date callback defined, check for show events flag --->
          <cfif ARGUMENTS.showEvents IS False>
            <!--- show callback, do not show events --->
            <cfset returnData = returnData & '<td class="#calStyle#Taken_#ARGUMENTS.calId#"><a href="#ARGUMENTS.dateCallback#?#ARGUMENTS.dateCallbackField#=#DateFormat(CreateDate(thisYear,thisMonth,iDay),'yyyy-mm-dd')#" class="calCallbackLink_#ARGUMENTS.calId#">#iDay#</a></td>'>
            <!--- otherwise --->
            <cfelse>
            <!--- show callback, show events --->
            <cfset returnData = returnData & '<td class="#calStyle#Taken_#ARGUMENTS.calId#"><a href="#ARGUMENTS.dateCallback#?#ARGUMENTS.dateCallbackField#=#DateFormat(CreateDate(thisYear,thisMonth,iDay),'yyyy-mm-dd')#" class="calCallbackLink_#ARGUMENTS.calId#">#iDay#</a><br />'>
            <cfloop query="qGetToday">
              <cfset todayVal = qGetToday["#ARGUMENTS.nameColumn#"]>
              <cfif ARGUMENTS.eventCallback EQ "">
                <cfset returnData = returnData & '<table><tr><td class="calEventData_#ARGUMENTS.calId#">#Left(todayVal,ARGUMENTS.eventChars)#</td></tr></table>'>
                <cfelse>
                <cfset callbackValue = qGetToday["#ARGUMENTS.eventCallbackColumn#"]>
                <cfset returnData = returnData & '<table><tr><td class="calEventData_#ARGUMENTS.calId#"><a href="#ARGUMENTS.eventCallback#?#ARGUMENTS.eventCallbackField#=#callbackValue#&amp;#ARGUMENTS.dateCallbackField#=#DateFormat(CreateDate(thisYear,thisMonth,iDay),'yyyy-mm-dd')#" class="calEventCallbackLink_#ARGUMENTS.calId#">#Left(todayVal,ARGUMENTS.eventChars)#</a></td></tr></table>'>
              </cfif>
            </cfloop>
            <cfset returnData = returnData & '</td>'>
            <!--- end checking for show event flag --->
          </cfif>
          <!--- end checking for date callback --->
        </cfif>
        <!--- end checking if there are events --->
      </cfif>
      <!--- increase day counter --->
      <cfset iDay = iDay + 1>
      <!--- otherwise --->
      <cfelse>
      <!--- this is not a calendar day, output an empty cell --->
      <cfset returnData = returnData & '<td class="calEmptyCell_#ARGUMENTS.calId#">&nbsp;</td>'>
      <!--- end checking if this is a calendar day cell --->
    </cfif>
    <!--- check if end of the week --->
    <cfif (iX Mod 7 IS 0)>
      <!--- is end of week, check if end of month --->
      <cfif (iX NEQ calendarDays)>
        <!--- is not end of month --->
        <cfset returnData = returnData & "</tr><tr>">
      </cfif>
    </cfif>
  </cfloop>
  <!--- end of month --->
  <cfset returnData = returnData & '</tr></table>'>
  <!--- return data --->
  <cfreturn returnData>
</cffunction>
</cfcomponent>
