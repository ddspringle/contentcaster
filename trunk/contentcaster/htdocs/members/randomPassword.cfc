<cfcomponent>
<cffunction name="randomPassword" access="public" returntype="string">
  <!--- get arguments --->
  <cfargument name="useLower" type="numeric" required="yes" hint="One of: 1 = use, 0 = not use">
  <cfargument name="useNumeric" type="numeric" required="yes" hint="One of: 1 = use, 0 = not use">
  <cfargument name="useUpper" type="numeric" required="yes" hint="One of: 1 = use, 0 = not use">
  <cfargument name="useSpecial" type="numeric" required="yes" hint="One of: 1 = use, 0 = not use">
  <cfargument name="passLength" type="numeric" required="yes" hint="The length of the password in digits (i.e. 10)">
  <!--- set pattern options, L = lowercase, N = numeric, S = special, U = uppercase --->
  <cfset patOpts = "LNSU">
  <!--- set the pattern result variable to blank --->
  <cfset pat = "">
  <cfset pwd1 = "">
  <!--- loop through from 1 to length of password to generate a complete pattern --->
  <cfloop index="z" from="1" to="#ARGUMENTS.passLength#" step="1">
    <!--- Generate a random number between 1 and 4 --->
    <cfset y = randrange(1,4)>
    <!--- set x to the value of the patOpts string specified by the y variable --->
    <cfset x = mid(patOpts,y,1)>
    <!--- append appropriate text to the pattern result variable depending on use and value of x --->
    <cfif ARGUMENTS.useLower EQ 1 AND x EQ "L">
      <cfset pat = pat & "L">
      <cfelseif ARGUMENTS.useNumeric EQ 1 AND x EQ "N">
      <cfset pat = pat & "N">
      <cfelseif ARGUMENTS.useUpper EQ 1 AND x EQ "U">
      <cfset pat = pat & "U">
      <cfelseif ARGUMENTS.useSpecial EQ 1 AND x EQ "S">
      <cfset pat = pat & "S">
      <!--- if this pass returns false, try again with a different value of x --->
      <cfelse>
      <cfset y = randrange(1,4)>
      <cfset x = mid(patOpts,y,1)>
      <cfif ARGUMENTS.useLower EQ 1 AND x EQ "L">
        <cfset pat = pat & "L">
        <cfelseif ARGUMENTS.useNumeric EQ 1 AND x EQ "N">
        <cfset pat = pat & "N">
        <cfelseif ARGUMENTS.useUpper EQ 1 AND x EQ "U">
        <cfset pat = pat & "U">
        <cfelseif ARGUMENTS.useSpecial EQ 1 AND x EQ "S">
        <cfset pat = pat & "S">
        <cfelse>
        <!--- if this pass returns false, keep trying with a different value of x --->
        <cfset y = randrange(1,4)>
        <cfset x = mid(patOpts,y,1)>
        <cfif ARGUMENTS.useLower EQ 1 AND x EQ "L">
          <cfset pat = pat & "L">
          <cfelseif ARGUMENTS.useNumeric EQ 1 AND x EQ "N">
          <cfset pat = pat & "N">
          <cfelseif ARGUMENTS.useUpper EQ 1 AND x EQ "U">
          <cfset pat = pat & "U">
          <cfelseif ARGUMENTS.useSpecial EQ 1 AND x EQ "S">
          <cfset pat = pat & "S">
          <!--- if all else fails, set to the first true use --->
          <cfelse>
          <cfset w = len(pat)>
          <cfif ARGUMENTS.useLower EQ 1 AND len(pat) EQ w>
            <cfset pat = pat & "L">
            <cfelseif ARGUMENTS.useNumeric EQ 1 AND len(pat) EQ w>
            <cfset pat = pat & "N">
            <cfelseif ARGUMENTS.useUpper EQ 1 AND len(pat) EQ w>
            <cfset pat = pat & "U">
            <cfelseif ARGUMENTS.useSpecial EQ 1 AND len(pat) EQ w>
            <cfset pat = pat & "S">
          </cfif>
        </cfif>
      </cfif>
    </cfif>
  </cfloop>
  <!--- generate random password --->
  <cfset ststring=structNew()>
  <cfloop index="i" from="1" to="#ARGUMENTS.passLength#" step="1">
    <cfif mid(pat,i,1) EQ "N">
      <cfset a = randrange(48,57)>
      <cfelseif mid(pat,i,1) EQ "S">
      <cfset a = randrange(35,43)>
      <cfelseif mid(pat,i,1) EQ "U">
      <cfset a = randrange(65,90)>
      <cfelseif mid(pat,i,1) EQ "L">
      <cfset a = randrange(97,122)>
    </cfif>
    <cfset pwd1 = pwd1 & chr(a)>
  </cfloop>
  <cfreturn pwd1>  
  <!---
		This CFC is copyright (c) 2006 Denard Davis Springle IV and Virtual Solutions Group. All Rights Reserved.
		This CFC is licensed under a Creative Commons 2.0 Attribution license. Removal of this notice from this CFC
		constitutes a breach of this license. For more information, please visit http://creativecommons.org/licenses/by/2.5/
--->
</cffunction>
</cfcomponent>
