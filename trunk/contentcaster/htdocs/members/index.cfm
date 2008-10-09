<cfparam name="URL.err" default="">
<!--- check if errors --->
<cfif URL.err NEQ "">
  <cfif URL.err EQ 1>
    <cfset errorText = "You must enter a value into the username and password fields and click submit to login.">
    <cfelseif URL.err EQ 2>
    <cfset errorText = "Your session has timed out. Please log in again.">
    <cfelseif URL.err EQ 3>
    <cfset errorText = "We were unable to find that username/password combination in our database. Please check your input and try again.">
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
<script type="text/javascript" language="javascript">
function hashIt() {
document.forms[0].password.value = hex_md5(document.forms[0].password.value);
var temp = document.forms[0].password.value + document.forms[0].heartbeat.value;
document.forms[0].password.value = hex_md5(temp);
}
</script>
</head>
<body topmargin="100" marginheight="100" leftmargin="0" marginwidth="0">
<!--- display any error messages, will be blank if none --->
<table cellpadding="0" cellspacing="0" border="0" align="center">
  <tr>
    <td height="180" bgcolor="#0091b5" width="458"><img src="../images/loginHeader.gif" height="65" width="458"/> <br />
      <table cellpadding="0" cellspacing="0" border="0" style="padding-top: 10px; padding-left: 20px; padding-right: 20px;">
        <tr>
          <td><span style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11pt; color: #ffffff;"> <cfoutput>#errorText#</cfoutput> </span> </td>
        </tr>
      </table>
      <br />
      <form id="memberLogin" method="post" action="authMember.cfm" onsubmit="hashIt()">
        <input type="hidden" name="heartbeat" value="<cfoutput>#hb#</cfoutput>" id="heartbeat" />
        <input type="hidden" name="temp" value="" id="temp" />
        <span class="loginText">username</span>
        <input name="username" type="text" id="username" class="loginBox"/>
        <br />
        <span class="loginText" style="padding-left: 2px;">password</span>
        <input name="password" type="password" id="password" class="loginBox"/>
        <br />
        <input name="Submit" type="image" class="loginButton" value="Submit" src="../images/loginButton.gif" alt="Login"/>
      </form></td>
  </tr>
  <tr>
    <td><img src="../images/loginFooter.gif" /> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div class="loginFooterText"><span style="padding-top: 30px; text-align:center; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; ">ContentCaster v<cfoutput>#version#</cfoutput> - The Open Source Content Cast Server</span></div></td>
  </tr>
</table>
</body>
</html>
