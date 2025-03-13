function logScreen(msg){
  var len = $("#adlog").html().split("<br>").length-1;
  if(len > 8){
      $("#adlog").html($("#adlog").html().substring($("#adlog").html().indexOf("<br>")+4)+msg+"<br>");
  }else{
    $("#adlog").html($("#adlog").html()+msg+"<br>");
  }
  //$.post( "logData.php", { message: msg }); // biffo deact this for production
}

function tryPlayAd(res){
	var myURL;
	// logScreen("Playing Spot with NumVBuddys=" + gNumVidUnits);
	var ad = local_json.global.filter(x => x.tag.startsWith('Spotlight'+res[1].substring(0, 21)));
	if (typeof ad[0] !== 'undefined' && ad.length == 1){
		ThisSpotDuration=ad[0].duration;
		setTimeout(function(){
			$("#jquery_jplayer_1").jPlayerFade().to(1000, 0.8, 0);
		},(calculatedOffset - 2000));// biffo was -1000

		setTimeout(function(){
			myURL='http://localhost:8888/?video=Spotlight'+encodeURIComponent(res[1].substring(0, 21))+'&a='+omxAudioTgt+'&dur='+ThisSpotDuration+'&callback=?';
			// logScreen("MyURL=" + myURL);
      		$.getJSON(myURL,function(data){
				if (myDebugMode)  logScreen("Inside getJSON with data.NumVBuds=" + gNumVidUnits);
				if (gNumVidUnits < parseInt(data.NumVBuds)) {
					gNumVidUnits = parseInt(data.NumVBuds);
					gVUnits[0]=data.V1;gVUnits[1]=data.V2;
					gVUnits[2]=data.V3;gVUnits[3]=data.V4;
					gVUnits[4]=data.V5;gVUnits[5]=data.V6;
					gVUnits[6]=data.V7;gVUnits[7]=data.V8;
					gVUnits[8]=data.V9;gVUnits[9]=data.V10;
				}
			} );
			try {   // now talk to VBuddies
				for (i=0;i<gNumVidUnits;i++) {
			     		//$.getJSON('http://'+gVUnits[i]+':8888/?video=Spotlight'+res[1].substring(0, 21)+'&a='+omxAudioTgt+'&dur='+ThisSpotDuration,function(data){});	  
			     		$.get('http://'+gVUnits[i]+':8888/?video=Spotlight'+encodeURIComponent(res[1].substring(0, 21))+'&a='+omxAudioTgt+'&dur='+ThisSpotDuration);
		  	   	}
			}
			catch (err) { }
      		// logScreen("Spotlight Duration: "+ThisSpotDuration);
      		playingAd = true;
      		adLock = true;
      		current_res = res;

      		setTimeout(function(){ 
       			// logScreen("Spotlight Duration Ended");
        			// next chunk handles Not an SP-Ad ///////////////
        			if(songTitle.indexOf('Spotlight') == -1 && playingAd == true && bootTestPass == true){
          				adLock = false;
          				tryStopAd();
        			}
        			else if(songTitle.indexOf('Spotlight') != -1 && bootTestPass == true){ // this is back2bak SP-Ads
          				adLock = false;
          				var res = songTitle.split("Spotlight",2);
          				if(current_res != res){
            				adLock = false;// biffo experimental add to stop issues
          				}
        			}	
        			else{
           				adLock = false;
        			}
			},((ThisSpotDuration*1000) - calculatedOffset)); //biffo was - (minus) calculatedOffset!

    		},calculatedOffset); // end of setTimeout
	}// end of if type not defined
	else{
		// logScreen("tryPlayAd Unsuccesful");
	}
}// end of funct TryPlayAd

function tryStopAd(){
	playingAd = false;
	playingVideo = false;
	setTimeout(function(){
 		$("#jquery_jplayer_1").jPlayerFade().to(1000, 0, 0.8);
	},(calculatedOffset+1250));//biffo was+1500
}
//
function sendShutdownSystem() {
  var MyURL;
      try {
	  for (i=0;i<gNumVidUnits;i++) {
            $.get('http://'+gVUnits[i]+':8888/doshutdown?k='+DIBsyskey);
           }
      }
      catch (err) {  }
    // MyURL='http://localhost:8888/doshutdown?k='+DIBsyskey;
      // $.get(MyURL);
      // myExec("sudo shutdown -h +1", function (error, stdout, stderr) { } );
      $.get( "DoShutdown.php", function(data) {  } ); 
}
// end of file
