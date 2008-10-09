<!--- set database params --->
<!--- set datasource name --->
<cfset ds = "mysqlcf_ccaster">
<!--- specify the username for the database --->
<cfset un = "ccaster">
<!--- specify the password for the database --->
<cfset pw = "g00dT!m3s">
<!--- specify the full path to the directory to store images --->
<!--- NOTE: This path must be writable by Coldfusion so you'll --->
<!---       need to set this directory to 777 if using Linux --->
<cfset contentPath = "#GetDirectoryFromPath(GetCurrentTemplatePath())#content/">
<!--- Specify the URL to the directory where the content is stored --->
<!--- NOTE: This is different from the path, this is the URL to the --->
<!---       path noted above. --->
<cfset contentUrl = "http://www.contentcaster.net/content/">
<!--- specify the filename prefix to be given to each uploaded content file --->
<!--- EX: my_daily_ (This will result in filenames such as my_daily_myuploadedcontent.jpg...) --->
<cfset contentPrefix = "!contentCaster_">
<!--- For error conditions of the contentCaster, you must assign --->
<!--- a default image, which is defined as the full URL --->
<!--- EX: http://mydomain/images/defaultImage.jpg --->
<cfset defImgUrl = "http://www.contentcaster.com/images/defaultImage.jpg">
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
<cfset version = "1.0">
<!--- company name --->
<cfset companyName = "Virtual Solutions Group">
<!--- Site title (i.e. ContentCaster) --->
<cfset siteTitle = "ContentCaster">
<!--- timeout value for members area, in minutes --->
<cfset tout = "15">
<!--- max contents --->
<cfset maxContent = 128>
<!--- max log rows to view --->
<cfset maxLogRows = "30">
<!--- global email settings --->
<cfset fromEmail = "youremail@yourdomain.net">
<cfset bccEmail = "youremail@yourdomain.net">
<cfset mailServer = "yourserver.yourdomain.net">
<cfset mailPort = "25">
<cfset mailUser = "username/youremail@yourserver.net">
<cfset mailPass = "password">
<!--- member invitation specific email settings --->
<!--- subject of join email (to user) --->
<cfset joinSubject = "You've been invited to the <cfoutput>#siteTitle#</cfoutput> network!">
<!--- location of login URL for user logins --->
<cfset loginURL = "http://www.contentcaster.net/members/">
<!--- member update specific email settings --->
<!--- subject of member update (to user) --->
<cfset updateSubject = "You're <cfoutput>#siteTitle#</cfoutput> network account has been updated!">
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
