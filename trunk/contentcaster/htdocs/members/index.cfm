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
<!--- set params --->
<cfparam name="URL.err" default="">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into the username and password fields and click submit to login.">
    <cfelseif URL.err EQ 2>
    <cfset errorText = "Your session has timed out. Please log in again.">
    <cfelseif URL.err EQ 3>
    <cfset errorText = "We're sorry but we are unable to find that username/password combination in our database. Please check your input and try again.">
    <cfelseif URL.err EQ 4>
    <cfset errorText = "The password you entered does not match the password in our database. Please check your input and try again.">
    <cfelseif URL.err EQ 5>
    <cfset errorText = "You have attempted to log into an area to which you do not have sufficient priviledges. This attempt has been logged as coming from #CGI.REMOTE_ADDR#.">
  </cfif>
  <cfelse>
  <cfset errorText = "">
</cfif>
<!--- generate a random number for heartbeat --->
<cfset hb = RandRange(100000,1000000)>
<!--- encrypt the heartbeat --->
<cfset encHb = Encrypt(hb,fishkey,'BLOWFISH','HEX')>
<!--- set heartbeat to ccast_sessionId cookie --->
<cfcookie name="ccast_sessionId" value="#encHb#" expires="1">
<!--- HTML --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Member Login</title>
<link href="../style/contentCaster.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/md5.js"></script>
<script type="text/javascript">
function hashIt() {
document.forms[0].password.value = hex_md5(document.forms[0].password.value);
var temp = document.forms[0].password.value + document.forms[0].heartbeat.value;
document.forms[0].password.value = hex_md5(temp);
}
</script>
</head>
<body class="loginBody">
<!--- display any error messages, will be blank if none --->
<form id="memberLogin" method="post" action="authMember.cfm" onsubmit="hashIt()">
  <table cellpadding="0" cellspacing="0" border="0" class="loginTable">
  <tr>
  <td class="loginHeader">&nbsp;</td>
  </tr>
    <tr>
      <td class="loginTd">
        <!--- display error text, if any --->
        <cfif URL.err NEQ "">
          <div class="loginError"> <cfoutput>#errorText#</cfoutput> </div>
        </cfif>
        <table>
          <tr>
            <td class="loginText">Username:</td>
            <td><input name="username" type="text" id="username" class="loginBox"/></td>
          </tr>
          <tr>
            <td class="loginText">&nbsp;Password:</td>
            <td><input name="password" type="password" id="password" class="loginBox"/></td>
          </tr>
          <tr>
            <td colspan="2" style="text-align:left;"><input name="Submit" type="image" class="loginButton" value="Submit" src="../images/loginButton.gif" alt="Login"/>
              <input type="hidden" name="heartbeat" value="<cfoutput>#hb#</cfoutput>" id="heartbeat" /></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="loginFooter">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="loginFooterText">ContentCaster v<cfoutput>#version#</cfoutput> - The Open Source Content Cast Server</td>
    </tr>
  </table>
</form>
</body>
</html>
