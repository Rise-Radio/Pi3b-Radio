var bootTestPass = false;
var playingAd = false;
var playingVideo = false;
var disableVideos = false;
var adLock = false;
var nextRes = false;
var songTitle;
var local_json = {};
var current_vid  = 0;
var current_res;
var loop_videos;
var started;
var delta;
var LastSpotStartedAt=0;// biffo
var LastSpotRestoreTime=0;// biffo
var LastSpotDuration=0;
var LastSpotName="";
var ThisSpotDuration=0;
var ThisSpotName="";
var configOffset=0;
var configDirty=false;
var KeyTimer=0;
var myDebugMode=false;
var ArmedShutdown=false;
var DIBsyskey = "none";

function resolveUrl(url, callback) {
  $.ajax({
    url: url,
    method: 'HEAD',
    complete: function(request) {
      // Get the final URL from the response and append the stream location
      var finalUrl = request.getResponseHeader('Location') || url;
      callback(finalUrl);
    },
    error: function() {
      console.error('Failed to resolve the redirected URL');
      callback(url); // Use the original URL with stream location if resolution fails
    }
  });
}

$(document).ready(function(){
    
    $.get( "loadoffset.php", function( data ) {
      if (data.length > 1){
		configOffset=parseInt(data);
      }else{
       	configOffset=0;
      }
    });
    
    $.get( "loadsyskey.php", function( data ) {
      if(data.length > 1){
		DIBsyskey=data.toString();
      }else{
       	DIBsyskey="none";
      }
    });

    $.get( "loadmode.php", function( data ) {
      if (data == "D") {
		myDebugMode=true;
      }else{
		myDebugMode=false;
      }
    });

  $.getJSON("http://localhost/latest_manifest.json", function(data){
    local_json = data;
    loop_videos = data.rotation;
  });
  
var fullUrl = "https://doitbestradio.streamguys1.com/"+stream_location;
 resolveUrl(fullUrl, function(finalUrl) {

 $("#jquery_jplayer_1").jPlayer({
    ready: function () {
      $(this).jPlayer("setMedia", {
            mp3: finalUrl
      });
      started = new Date().getTime() / 1000; $(this).jPlayer('play');
    },
    swfPath: "/assets/js",
    });
 });
 
  setInterval(function(){
    var now = new Date().getTime() / 1000;
    var playerTime = $('#jquery_jplayer_1').data().jPlayer.status.currentTime;
    delta = ((now-started)-playerTime);
    //console.log("Time Played: "+playerTime);
    //console.log("Offset: "+(now-started));
 // console.log(" Delta: "+delta);
    if (delta > 8 ){ //biffo was 25 then 20 then 17  now 8
      logScreen("Delay delta too long");
      setTimeout(function(){ location.reload();}, 5000);// was 3000 biffo
    }
	    // biffo moved here
	$(document).keyup( function(event) {
		
		if ( (Date.now() - KeyTimer) > 500) {
			KeyTimer=Date.now();
			$('#rise-radio-title').show();
			console.log("You pressed " + event.which);
			if (event.which == 107 ){ //biffo is a + so add time to configOffset
				configOffset=(configOffset <= 14750)?(configOffset+250):15000;
				configDirty=true;
				ArmedShutdown=false;
			}else if (event.which == 109) { // biffo a minus 
				configOffset=(configOffset >= 500)?(configOffset-250):250;
				if (configOffset < 250) configOffset=250;
				configDirty=true;
				ArmedShutdown=false;
			}else if (event.which == 83) { // biffo an S
				ArmedShutdown=true;
			}else if (event.which == 72) { // biffo an H
				if (ArmedShutdown==true)  { sendShutdownSystem(); logScreen("Shutting down all connected systems..."); }
			}
			else 
				ArmedShutdown=false;
			logScreen("New Video configOffset="+ configOffset+"msecs. Cur Delta="+ delta);		
		}
      });
  }, 2000);// biffo was 2000 then 6000

  setInterval(function(){
    
    if (configDirty==true) {
    		configDirty=false;
	     $.get( "saveoffset.php?offset="+configOffset);
    }
  }, 60000); // biffo was 5000



  //
  if (!onlyAudio) {
  	setTimeout(function(){
  		if($("#songtitle").html() == "Syncing with server..."){
			logScreen("Socket Unable to Connect, Restarting Process in 3 Seconds");
			setTimeout(function(){
				location.reload();
			}, 3000);
		}else{
			logScreen("Socket Connected...launching play script in 5 Seconds");
			setTimeout(function(){
				// logScreen("Playing Loop");
				// playLoop();
				bootTestPass = true;
				$("#rise-radio-title").hide('slow');//biffo deact to see
			}, 5000);
		}
  	},15000);
  }
  else { //Just audio
   	$("#songtitle").html("Playing " + stream_location);    	// added for John
  	logScreen("Audio Player is operating in Audio-Only mode. ");

  }
  //



});// end of jQuery on-ready function
// end of file


