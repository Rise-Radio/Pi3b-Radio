var debugmode=false; 
var onlyaudio=false; 
var express = require('express');
// special version for BuddySupport by Steve Wilson -- THIS IS AUDIO MODULE VERSION!!!
var http = require('http');
var fs = require('fs');
var MySleep = require('system-sleep');

var myExec = require('child_process').exec;
// var myExec = require('child_process').execFile;
var MyLastTimeCalled=0;
var audioTgtStr = "H";
var SpotVidName='';
var myDur=30.0;//SpotDuration in secs as a double
var DIBsyskey="none";
var loopVideos;
var SpotVideos;
var json_vidData;
var CurLoopVid=0;
var PlayerStatus = 0;  //0=stopped 1=looping,2=SpotAdPlaying
var MaxVBuds = 10;
var VBudList = { };
VBudList.NumVBuds="0"; VBudList.V1="0.0.0.0"; VBudList.V2="0.0.0.0"; VBudList.V3="0.0.0.0";
VBudList.V4="0.0.0.0"; VBudList.V5="0.0.0.0"; VBudList.V6="0.0.0.0"; VBudList.V7="0.0.0.0";
VBudList.V8="0.0.0.0"; VBudList.V9="0.0.0.0"; VBudList.V10="0.0.0.0";

//
function StartLoopVids() {
	var isVid;
	
	if (PlayerStatus==2) return; // dont interrupt Ads
	else if (PlayerStatus==1) { // still looping a vid
		return;
	} 
	else { // player is stopped so play a LoopVid
		if (loopVideos.length < 1) { 
			if (debugmode) console.log("No Loop Videos to play!");
			return;
		}
		PlayerStatus=1;//start playing
		MyVidNameAndPath='/var/www/html/assets/videos/' + loopVideos[CurLoopVid].path;  
		// console.log("Playing" + MyVidNameAndPath);
		// this had to die --> if (MyVidNameAndPath.indexOf('.mp4') <32)		MyVidNameAndPath=MyVidNameAndPath + '.mp4';
		isVid=true;
		if (MyVidNameAndPath.indexOf('.mp4') <32)		isVid=false;
		myExec("touch -c '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } ); // mark as played to escape deletion
 		MySleep(100);// time to touch
	      	if (audioTgtStr=="H") {
	      		if (isVid) {
					if (debugmode) myExec("omxplayer  --win '300,300,600,600' --no-osd --no-keys -o hdmi --vol -6000 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
					else myExec("omxplayer  --no-osd --no-keys -o hdmi --vol -6000 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
			}
			else {
					myExec("gpicview '" + MyVidNameAndPath + "'",function(error,stdout,stderr) {});
			}
		 }
	      	else {
	      		if (isVid) {
					if (debugmode) myExec("omxplayer  --win '300,300,600,600' --no-osd --no-keys -o hdmi --vol -6000 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
					else myExec("omxplayer --no-osd --no-keys --vol -6000 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
			}
			else {
				myExec("gpicview '" + MyVidNameAndPath + "'",function(error,stdout,stderr) {});
			}
		 }

		var myDuration = parseInt(loopVideos[CurLoopVid].duration) *1000 +500; // add 500msecs
		console.log("Playing Loop: Duration for " + MyVidNameAndPath + " was " + myDuration);
		CurLoopVid = parseInt(CurLoopVid) + 1;
		if (CurLoopVid >= loopVideos.length) CurLoopVid = 0;
		setTimeout( function () { StopLoopVids("L"); }  ,myDuration);//callback to stop vid
	}
}
//
function StopLoopVids(cmd) {
	//if (debugmode) console.log("Called StopLoopVids with" + cmd);
	if (PlayerStatus==2) return; // dont interrupt Ads     	
	myExec("sudo pkill omxplayer.bin", function (error, stdout, stderr) { } );
	myExec("sudo pkill gpicview*", function (error, stdout, stderr) { } );
	if (cmd == "L") { // it came from looper
		MySleep(250);	PlayerStatus=0;
		setTimeout( function () { StartLoopVids("SL"); } ,500 ); // wait 500mili
	}
	else {
		if (debugmode) console.log("Stopped by SpotAd");
		MySleep(1);	PlayerStatus=0;
	}
	return;
}
//
function FetchSpotAd(thePath2Vid) {
	var i=0;
	var localName;
	var serverPath="";
	var tmpStr;
	var foundAt = -1;
	var myCommand;

	if (debugmode) console.log("Calling WGET to fetch SpotAd from server: " + thePath2Vid);
	if (SpotVideos.length < 1) { 
		if (debugmode) console.log("No Spot Info to process!");
		return;
	}
	else {
		try {
			localName=thePath2Vid.substr(28);//skip over path
			localName=localName.substr(0, localName.length - 4) // clip extension for search;
			for (i=0;i<SpotVideos.length;i++) {
				tmpStr=SpotVideos[i].tag;
				tmpStr=tmpStr.substr(0,30);
				if (localName === tmpStr) {
					foundAt=i;
					break;
				}
			}
		}
		catch (myError) { console.log(myError); }
		if (foundAt > -1) {
			//serverPath="http://loopbuilder.doitbestradio.com/storage/app/" + SpotVideos[foundAt].server_path;
			serverPath="http://riseradio.s3.amazonaws.com/" + SpotVideos[foundAt].server_path;
			localName = "/var/www/html/assets/videos/" + localName + ".mp4";
          		myCommand = '/usr/bin/wget "' + serverPath + '" -O "' + localName + '"';
			if (debugmode) console.log("About to call WGET with the following params: " + myCommand);
			myExec(myCommand, function (error, stdout, stderr) { } ); // go fetch it!
		}
	}
	return;
}
//
function PlaySpotAdVid(fullPath2Vid, theDuration) {

	if (!(fs.existsSync(fullPath2Vid))) {
		if (debugmode) console.log("Spotfile does not exist - we must fetch: " + fullPath2Vid);
		FetchSpotAd(fullPath2Vid);
		return;
	}
	if (debugmode) console.log("Called PlaySpotAdVid with" + fullPath2Vid);
	if (PlayerStatus==2) return; // dont interrupt other SpotAds
	else if (PlayerStatus==1) { // still looping a vid
		StopLoopVids("S");
	} 
	PlayerStatus=2;// Set SpotStatus
	myExec("touch -c '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } ); // mark as played to escape deletion
 	MySleep(100);// moved this here from main loop
	if (audioTgtStr=="H") {
		if (debugmode) myExec("omxplayer  --win '300,600,600,900' --no-osd --no-keys -o hdmi --vol 0 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
		else myExec("omxplayer  --no-osd --no-keys -o hdmi --vol 0 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );

	}
      	else {
		if (debugmode) myExec("omxplayer  --win '300,600,600,900' --no-osd --no-keys --vol 0 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
		else myExec("omxplayer  --no-osd --no-keys --vol 0 '" + MyVidNameAndPath +"'", function (error, stdout, stderr) { } );
	}
	var myDuration = parseInt(theDuration)*1000 + 2500; // add extra time 2500msecs
	setTimeout( function () { StopSpotAdVids(); }  ,myDuration);//callback to stop vid
}
//
function StopSpotAdVids() {
	if (debugmode) console.log("Called StopSpotAdVids");
	myExec("sudo pkill omxplayer.bin", function (error, stdout, stderr) { } );
	PlayerStatus=0;//stopped playing
	setTimeout( function () { StartLoopVids("SL"); } ,500 ); // wait 500mili
}
// START OF INITIAL LAUNCH-CODE
if (fs.existsSync("/var/www/html/onlyaudio.cfg")) {   onlyaudio=true;  } // simple shutdown of video system

var app = express();

// app.use(cors());
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

// Added read debugmode from common file
fs.readFile("/var/www/html/loadmode.cfg", 'utf8', function(err, data) {
  if (err) throw err;
  if ((data.toString().trim() ) === "D") { debugmode=true; console.log("debugmode is on"); }
  else { debugmode=false; }
});
//
fs.readFile("/var/www/html/DIBsyskey.cfg", 'utf8', function(err, data) {
  	if (err) throw err;
	DIBsyskey=data.toString().trim();
 });
//

//Steve new video loop loader
try {
	json_vidData= JSON.parse(fs.readFileSync("/var/www/html/latest_manifest.json"));  
	loopVideos=json_vidData.rotation;
	SpotVideos=json_vidData.global;
}
catch (e) {
	if (debugmode) console.log(e.message);
	return;
}
//
app.set('port', 8888);

//
app.get('/testUp', function(req, res){
  res.writeHead(200, {'content-type': 'text/plain'});
  res.end(JSON.stringify('running'));
});
//
app.get('/doshutdown', function(req, res){
  res.writeHead(200, {'content-type': 'text/plain'});
  res.write("Shutting down");
  res.end();
  if (req.query.k==DIBsyskey) {
	  // MySleep(5);   //instant shutdown now desired
	  myExec("sudo pkill omxplayer.bin", function (error, stdout, stderr) { } );
	  myExec("sudo pkill iceweasel", function (error, stdout, stderr) { } );
	  myExec("sudo shutdown -h +0", function (error, stdout, stderr) { } );
  }
});
//
app.get('/AddVBuddy', function(req, res){   //called by other video units, UNIQUE to Audio Pi
   res.writeHead(200, {'content-type': 'application/json'});
  //res.writeHead(200, {'content-type': 'text/plain'});

  var hisIP = req.query.vip;
  var hisHostName = req.query.hn; // use later
  var MyX;
  var MyTest;
  var MyNumBuds=parseInt(VBudList.NumVBuds);
  if ((hisIP.length > 6) && (MyNumBuds < MaxVBuds)) {
		if (hisIP.lastIndexOf('.') > 4) {
			//see if it is already stored
			for (MyX=1;MyX <= MyNumBuds; MyX++) {
				switch (MyX) {
					case 1: MyTest=VBudList.V1;break;
					case 2: MyTest=VBudList.V2;break;
					case 3: MyTest=VBudList.V3;break;
					case 4: MyTest=VBudList.V4;break;
					case 5: MyTest=VBudList.V5;break;
					case 6: MyTest=VBudList.V6;break;
					case 7: MyTest=VBudList.V7;break;
					case 8: MyTest=VBudList.V8;break;
					case 9: MyTest=VBudList.V9;break;
					case 10: MyTest=VBudList.V10;break;
				}
				if (MyTest == hisIP) {
					res.end(JSON.stringify( "AlreadyInVBudList"));
					return;
				}
			}
			MyX=MyNumBuds + 1;
			if (MyX <= MaxVBuds) {
				VBudList.NumVBuds = MyX.toString();
				// actually add to list
				switch(MyX) {
				    case 1:VBudList.V1 = hisIP;break;
				    case 2:VBudList.V2 = hisIP;break;
				    case 3:VBudList.V3 = hisIP;break;
				    case 4:VBudList.V4 = hisIP;break;
				    case 5:VBudList.V5 = hisIP;break;
				    case 6:VBudList.V6 = hisIP;break;
				    case 7:VBudList.V7 = hisIP;break;
				    case 8:VBudList.V8 = hisIP;break;
				    case 9:VBudList.V9 = hisIP;break;
				    case 10:VBudList.V10 = hisIP;break;
				}
				if (debugmode) console.log("Added a buddy! " + hisIP);// deact later
			}
			else {
				if (debugmode)  console.log("Too many buddies!");
				 res.end(JSON.stringify( "DidNotAddVBudListFull"));
				 return;	
			}
		}
    res.end(JSON.stringify( "Added2VBudList"));
    return;
  }
  else {
    res.end(JSON.stringify( "DidNotAdd2VBudList"));
    return;
  }

});
///////////////////////////////////////
app.get('/', function(req, res){
   res.writeHead(200, {'content-type': 'application/javascript'});
  res.write(req.query.callback + '(' + JSON.stringify(VBudList) + ')');//biffo quick out, report cur VBudList
  res.end();
  
  // console.log("Current VBulIst = " + JSON.stringify(VBudList));

 MyLastTimeCalled=Date.now();
 myDur=parseFloat(decodeURIComponent(req.query.dur));
  SpotVidName=decodeURIComponent(req.query.video);
  if (!(SpotVidName.startsWith("Spot")))  return;//bail out if not Spot
  if (SpotVidName.indexOf('.mp4') <3)		SpotVidName=SpotVidName + '.mp4';
  MyVidNameAndPath='/var/www/html/assets/videos/'+SpotVidName;
  if (req.query.a !== undefined) {
  	if (req.query.a.startsWith('H'))		audioTgtStr="H";
    	else								audioTgtStr="A"; // use audio jack
  }
  else								audioTgtStr="A"; // use audio jack
  PlaySpotAdVid(MyVidNameAndPath,myDur);// new call handles all
  // res.end(JSON.stringify('success'));
  // console.log("Calling res.end at END\n");
  // res.end();// biffo moved up high
});


http.createServer(app).listen(app.get('port'), function(){
    if (debugmode) console.log("Express server listening on port " + app.get('port'));
    	StartLoopVids(); // start loops after all is loaded
})
