<?php
require('config.php');
//shell_exec('pgrep mplayer | xargs kill');
//shell_exec('pgrep omxplayer | xargs kill');
//comment out the next two lines and run in terminal to get msgs from nodejs
//shell_exec('pgrep node | xargs kill -9');
//shell_exec('pgrep vlc | xargs kill');// a spacer for time
//shell_exec('node /var/www/html/assets/nodeserver/mainAudio.js > /dev/null 2>/dev/null &');
//shell_exec('/usr/bin/mplayer http://doitbestradio.streamguys1.com/'.$config['STREAM_TITLE'].' -ao alsa:device=hw > /dev/null 2>/dev/null &');

$onlyAudioPHP=0;

if (file_exists('/var/www/html/onlyaudio.cfg')) 	$onlyAudioPHP=1; else $onlyAudioPHP=0;


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Do it Best Radio TV</title>
    <link href="assets/sass/styles.css" rel="stylesheet" type="text/css">
    <!-- TODO: Move this to sass, committed from deploy test system -->
    <style>
        <?php //* { cursor: none !important } ?>
        #stream, #stream > source { display: none !important; }
        #adcont { display: none !important; }
        #rise-radio-title #debug-area { width: 1096px !important; }
	      #rise-radio-title {display: block; }
        #progress{ color: #636363;font: 16px arial, sans-serif;}
        #top-right{ position: absolute; top:150px; right:0px; color:#FFF;}
        #bottom-left{ position: absolute; bottom:-150px; left:0px; color:#FFF; z-index: 9999;}
    </style>
  <script type="text/javascript" >
  //a few globals
  var onlyAudio = "<?= $onlyAudioPHP ?>";
  onlyAudio = parseInt(onlyAudio);
  if (onlyAudio === 1) onlyAudio=true; else onlyAudio=false;
  </script>
  
    
    
</head>
<body style="overflow: hidden;">
  <div id="top-right"></div>
  <div id="bottom-left"></div>
  <div style="cursor: none; !important; height: 1080px;">
    <div id="rise-radio-title">
        <h1>Do it Best Radio TV</h1>
        <span id="songtitle">Syncing with server...</span>
        <div id="headerinfotitle">
            Do it Best Radio TV Starting:
        </div>
        <div id="debug-area">
            <div id="adlog">
              Starting Boot Check...<br/>
            </div>
            <div id="progress">
                Testing Network Speed...
            </div>
        </div>
    </div>
  </div>
  <div id="jquery_jplayer_1" class="jp-jplayer"></div>
  <script type="text/javascript">
  // multiunit stuff
   var gNumVidUnits=0;  
   // the next line must be edited if we go over 10 video units - biffo
   var gVUnits=[ '0','0','0','0','0','0','0','0','0','0'];
   var apiKey = '<?=$config['API_KEY']?>'; //Paste your unique SGmetadata API key here.
  var scraperUUID = '<?=$config['scraperUUID']?>';  //Paste your scraper's UUID here.
   var stream_location = '<?php echo $config['STREAM_TITLE']; ?>';
  var calculatedOffset;
    //Select audio out for omxplayer
  var omxAudioTgt = '<?=$config['AUDIO_OUT']?>';
  if (omxAudioTgt == "HDMI")   omxAudioTgt="H";  else omxAudioTgt="J";
   </script>
  <script type="text/javascript" src="/assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="/assets/js/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="/assets/js/jquery.jplayer.fade.min.js"></script>
  <script type="text/javascript" src="/assets/js/socket.io-1.4.5.js"></script>
  <script type="text/javascript" src="/assets/js/functions.js"></script>
  <script type="text/javascript" src="/assets/js/bootCheck.js"></script>
  <script type="text/javascript" src="/assets/js/socketCalls.js"></script>

</body>
</html>
