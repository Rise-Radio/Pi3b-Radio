var playingAd = true;
var playingVideo = false;
var loading = new Date();
var currentdate1 = new Date();
var local_json = {};
var current_vid  = 0;
var configOffset = parseInt("<?php echo $config['SPOTLIGHT_OFFSET']; ?>");
var offset  = 0;
function myOnCanPlayFunction() {
  playing = new Date();
  if(offset == 0){
    offset = playing.getTime()-currentdate1.getTime();
  }
  console.log('Can play'+playing.getTime());
}
$(document).ready(function(){
    var currentdate1 = new Date();
    console.log('On Load '+currentdate1.getTime());
    $.getJSON("http://localhost/latest_manifest.json", function(data){
      local_json = data;
      loop_videos = data.rotation;

      console.log(local_json);
    });
});
$(document).keypress(function(event) {
    $("#progress").html("Test");
    $('#rise-radio-title').show();
});

function incrementVid(){
  current_vid++;
  if(current_vid == loop_videos.length){
    current_vid = 0;
  }
}

function playLoop(){
  if(!playingVideo){
    $.getJSON('http://localhost:8888/?video='+loop_videos[current_vid].path+'&offset=0&mute=true&callback=?', function (data) {});
    playingVideo = true;
    setTimeout(function(){
      if(!playingAd){
        playingVideo = false;
        playLoop();
      }
    },parseInt(loop_videos[current_vid].duration*1000));
    incrementVid();
  }
}
//Paste your unique SGmetadata API key here.
var apiKey = '<?=$config['API_KEY']?>';

//Paste your scraper's UUID here.
var scraperUUID = '<?=$config['scraperUUID']?>';

//This is the SGmetadata socket connection url.
var sgMetadataServer = 'http://jetm.streamguys.com:8000/';

var socketOptions = {
'forceNew':true,
'query':'key='+apiKey
};

//Connect to the SGmetadata socket.
var socket = io.connect(sgMetadataServer, socketOptions);

//When the socket connects, emit the listen event
//to receive metadata for our specific scraper.
socket.on('connect', function() {
  socket.emit('listen', scraperUUID);
});

//Register our main socket metadata event handler.
//When our scraper's metadata changes, it will be
//pushed to this client through this event handler.
socket.on('metadata', function(metadata) {
  var currentdate = new Date();
  var calculatedOffset = 6000+offset+configOffset;
  var songTitle = metadata[0].StreamTitle;
  //var songTitle = "Mandisa - Spotlight_Cabot_Deck_Pro_Grilling";

  var res = songTitle.split("Spotlight",2);
  console.log('Offset: '+offset);
  if(songTitle.indexOf('Spotlight') != -1 && offset != 0){
    $.each(local_json.global, function(i, item) {
      if(item.tag == 'Spotlight'+res[1]){
        console.log('Duration:'+item.duration);
        /*
        setTimeout(function(){
          if(!playingAd){
            $("#myAudio").animate({volume: 1}, 2000);
            console.log('turning Volume Up');
          }
        },parseInt((parseInt(item.duration)*1000)+calculatedOffset+1000));
        */
        console.log('turning Volume Up in :'+((parseInt(item.duration)*1000)+calculatedOffset+1000)+ " Seconds");
      }
    });
    setTimeout(function(){
      //$.getJSON('/volumeDown.php', function (data) {});
      //$("#myAudio").animate({volume: 0}, 2000);
    },(calculatedOffset-3000));
    setTimeout(function(){
      console.log("Playing:Spotlight"+res[1]);
      console.log("Calling"+'http://localhost:8888/?video=Spotlight'+res[1].substring(0, 21)+'&offset='+calculatedOffset+'&callback=?');
      $.getJSON('http://localhost:8888/?video=Spotlight'+res[1].substring(0, 21)+'&offset=500&callback=?', function (data) {});
    },(calculatedOffset-500));
  }
  setTimeout(function(){
    if(metadata[0].StreamTitle.indexOf('Spotlight') != -1){
      playingAd = true;
      //offset = 1;
    }else{
      if(playingAd == true){
        playingAd = false;
        playLoop();
      }
      //offset = 1;
      console.log('Not Ad');
      setTimeout(function(){
        //$.getJSON('/volumeUp.php', function (data) {});
      }, 1000);
      playingAd = false;
    }
    //Do something with the metadata object from the server.
    $("#songtitle").html(metadata[0].StreamTitle);
    $("#headerinfo").html(metadata[0].StreamTitle+" "+currentdate.getTime());
    console.log("New metadata received from the server: ", metadata[0].StreamTitle+" "+currentdate.getTime());
  },calculatedOffset);
});

socket.on('disconnect', function(error) {
  console.error('Disconnected from socket server.', error);
});
