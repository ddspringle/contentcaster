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
<!--- set database params --->
<!--- set datasource name --->
<cfset ds = "mysqlcf_ccaster">
<!--- specify the username for the database --->
<cfset un = "yourownusername">
<!--- specify the password for the database --->
<cfset pw = "yourownpassword">
<!--- specify the full path to the directory to store images --->
<!--- NOTE: This path must be writable by Coldfusion so you'll --->
<!---       need to set this directory to 777 if using Linux --->
<cfset contentPath = "#GetDirectoryFromPath(GetCurrentTemplatePath())#content/">
<!--- Specify the URL to the directory where the content is stored --->
<!--- NOTE: This is different from the path, this is the URL to the --->
<!---       path noted above. --->
<cfset contentUrl = "http://www.yourdomain.com/content/">
<!--- specify the filename prefix to be given to each uploaded content file --->
<!--- EX: my_daily_ (This will result in filenames such as my_daily_myuploadedcontent.jpg...) --->
<cfset contentPrefix = "ContentCaster_">
<!--- Define the width to display images at in content manager, 100px to 200px is nominal --->
<cfset imageWidth = "50">
<!--- video controls --->
<!--- define autostart option (true|false) --->
<cfset autostart = "false">
<!--- define showvolume option (true|false) --->
<cfset showVolume = "false">
<!--- define showdigits option (see flvplayer docs for definition)--->
<cfset showDigits = "total">
<!--- define video buffer length (seconds) --->
<cfset bufferLength = 5>
<!--- define video preview width in px--->
<cfset videoWidth = "80">
<!--- define video preview height in px (add extra px for controls!)--->
<cfset videoHeight = "63">
<!--- define if showeq (fake eq) on audio files player (true|false) --->
<cfset showEq = "true">
<!--- BLOWFISH encryption key (REQUIRED!) Make one with: <cfoutput>#GenerateSecretKey('BLOWFISH')#</cfoutput>) --->
<cfset fishkey = "ZHigwjK/W+kXgu7ZxPfHCQ==">
<!--- current itteration of ContentCaster --->
<cfset version = "1.1">
<!--- company name --->
<cfset companyName = "Virtual Solutions Group">
<!--- Site title (i.e. ContentCaster) --->
<cfset siteTitle = "ContentCaster">
<!--- timeout value for members area, in minutes --->
<cfset tout = "15">
<!--- max contents per category--->
<cfset maxContent = 128>
<!--- max log rows to view --->
<cfset maxLogRows = "30">
<!--- first row color in content/category/member lists --->
<cfset firstRow = "BBCCFF">
<!--- second row color in content/category/member lists --->
<cfset secRow = "CCFFBB">
<!--- show validation --->
<cfset showValidation = True>
<!--- global email settings --->
<cfset fromEmail = "youremail@yourdomain.net">
<cfset bccEmail = "youremail@yourdomain.net">
<cfset mailServer = "yourserver.yourdomain.net">
<cfset mailPort = "25">
<cfset mailUser = "username/youremail@yourserver.net">
<cfset mailPass = "password">
<!--- member invitation specific email settings --->
<!--- subject of join email (to user) --->
<cfset joinSubject = "You've been invited to the #siteTitle# network!">
<!--- location of login URL for user logins --->
<cfset loginURL = "http://www.yourdomain.com/members/">
<!--- member update specific email settings --->
<!--- subject of member update (to user) --->
<cfset updateSubject = "You're #siteTitle# network account has been updated!">
<!--- create category specific email settings --->
<!--- turn on (1) or off (0) email on creation of new categories --->
<cfset emailOnCreate = 1>
<!--- email address of recipient of creation emails --->
<cfset createTo = "youemail@yourdomain.net">
<!--- subject of creation emails --->
<cfset createSubject = "A new category has been created!">
<!--- Base Directory --->
<cfset baseDir = "#GetDirectoryFromPath(GetCurrentTemplatePath())#">
<!--- NOTES:

The following list is a definition of what contentType in the a_mimetype database mean:

0 = iconFile()
1 = image
2 = video
3 = quicktime
4 = flash (swf)
5 = mp3 audio
6 = realplayer
7 = wav audio
8 = aiff audio
9 = au audio
--->