<!-- 
// This script determines correct code required to embed MEDIA files 
// for a large number of browsers, including AOL and WebTV
// Windows Media Player is required and always used, except for WebTV
// Written by Les Gorven, http://midistudio.com/ 
// Ver. 3.0  Last Updated: January 17, 2006


function playMedia(mediaURL,rpt,height,width) {

var mediaURL,rpt,height,width

if (GetBrowser() == "Netscape") 
	embedMPlayer(mediaURL,rpt,height,width);  
if (GetBrowser() == "IE") 
	embedIEobject(mediaURL,rpt,height,width);
if (navigator.appName.substring(0,5) == "WebTV")
	embedSource(mediaURL,rpt,height,width)
}

function embedSource(mediaURL,rpt,height,width) {

    var CodeGen = ""
    var mediaURL,rpt,height,width
 		 	
	 CodeGen = '<embed src="' + mediaURL + '"' + '\n' ;
	 CodeGen += ' height=' + height + ' width=' + width + ' autostart="true"' + '\n'
	 CodeGen += ' LOOP=' + rpt + '>'
	 
    document.write(CodeGen)

}


function embedMPlayer(mediaURL,rpt,height,width)	{


		CodeGen = "" 
    	var mediaURL,rpt,height,width
				 	
		CodeGen = '<embed type="application/x-mplayer2" ' + '\n' ;
    	CodeGen = CodeGen + ' pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" ' + '\n' ;
	 	CodeGen = CodeGen + 'Name="MediaPlayer" ' + 'src="' + mediaURL + '" ' + '\n' ;
	 	CodeGen = CodeGen + 'autoStart=1 ' ;
		if ((height == 24) && (width == 299)) 
			CodeGen = CodeGen + 'ShowStatusBar=1 '; 
		if ((height >= 50) && (width >= 200)) 
			CodeGen = CodeGen + 'ShowStatusBar=1 '; 
		if ((height <= 49) && (width != 299))
			CodeGen = CodeGen + 'ShowStatusBar=0 '; 
		
		CodeGen = CodeGen + 'playCount=' + rpt + ' ' ;
		CodeGen = CodeGen + 'volume=-1 ' ;
		CodeGen = CodeGen + 'HEIGHT=' + height + ' WIDTH=' + width + '>'
				
		 
		document.write(CodeGen)
	
}

function embedIEobject(mediaURL,rpt,height,width){


		CodeGen = "" 
    	var mediaURL,rpt,height,width

		CodeGen = '<object id=Player' + '\n' ;
		CodeGen += 'codeBase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902' + '\n' ;
		CodeGen += 'type=application/x-oleobject height=' + height + ' width=' + width + '\n' ;
		CodeGen += ' standby="Loading Microsoft® Windows® Media Player components..." ' + '\n' ;
		CodeGen += 'classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95"> ' + '\n' ;
		CodeGen += '<param NAME="Filename" VALUE="' + mediaURL + '">' + '\n' ;
		if ((height == 24) && (width == 299)) 
			CodeGen += '<param NAME="ShowStatusBar" VALUE= "true">';
		if ((height >= 50) && (width >= 200)) 
			CodeGen += '<param NAME="ShowStatusBar" VALUE= "true">'; 
		if ((height <= 49) && (width != 299))
			CodeGen += '<param NAME="ShowStatusBar" VALUE= "false"> ';
		
		CodeGen += '<param NAME="autoStart" VALUE="true"><param NAME="Volume" VALUE="-1">' + '\n' ;
		CodeGen += '<param NAME="playCount" VALUE=' + rpt + '></object>'
		
		document.write(CodeGen)

}

function GetBrowser()
{
   var agt=navigator.userAgent.toLowerCase();
   if( ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1)) )
       return "IE";
   else if( ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
         && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
         && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1)) )
       return "Netscape";
   else
       return "unknown";
}
//-->
