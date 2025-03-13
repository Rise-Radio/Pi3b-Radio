//This is the SGmetadata socket connection url.
var sgMetadataServer = 'http://jetio.streamguys.com:8000/';
var socketOptions = {
'forceNew':true,
'query':'key='+apiKey
};

if (!onlyAudio) {
	//Connect to the SGmetadata socket.
	var socket = io.connect(sgMetadataServer, socketOptions);

	//When the socket connects, emit the listen event
	//to receive metadata for our specific scraper.
	socket.on('connect', function() {
	  	try {
	    		socket.emit('listen', scraperUUID);
	  	}
	  	catch(err) {
	    		logScreen(err.description)
	  	}

	});
} // end of !onlyAudio

//Register our main socket metadata event handler.
//When our scraper's metadata changes, it will be
//pushed to this client through this event handler.
if (!onlyAudio) {
	socket.on('metadata', function(metadata) {
  		songTitle = metadata[0].StreamTitle;

var xhr = new XMLHttpRequest();
xhr.open('GET', "http://localhost:8080/now-playing.php?what=setaudio&title="+songTitle, true);
xhr.send();

		calculatedOffset=configOffset; // biffo hard target test was 7000+config
		if(songTitle.indexOf('Spotlight') != -1 && bootTestPass == true && adLock == false){
			var res = songTitle.split("Spotlight",2);
			if(current_res != res){
			      tryPlayAd(res);
		    	}
		}else if(songTitle.indexOf('Spotlight') == -1 && playingAd == true && bootTestPass == true && adLock == false){
			tryStopAd();
		}else if(bootTestPass == true){
		   // logScreen("Changing Song:"+songTitle);
		}
  		setTimeout(function(){
    			$("#songtitle").html(metadata[0].StreamTitle);
  		},calculatedOffset);
	});
	// biffo -- maybe try wrapping anony funct in a try catch block? Below?
	socket.on('disconnect', 
	   function(error) {  
	    	try { 
	    	       logScreen('Disconnected from socket server.', error);// was console.error
	    	}
	    	catch(err) {
	    	       logScreen(err.description);
	    	}
	});
} // end of if !onlyAudio
