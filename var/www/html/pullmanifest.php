<pre>
<?php
error_reporting(E_ALL);
ini_set('display_errors',1);
ini_set('max_execution_time', 0);
ini_set('default_socket_timeout', 600);

/**
 * Updates the units videos
 * 1. Dials into the manifest server
 * 2. Gets the manifest for this unit
 * 3. If it looks ok, it downloads the new videos into a tmp directory
 * 4. If the downloads completed successfully, it deletes the old videos
 * 5. If the downloads completed successfully, it moves the tmp videos to the live directory
 * 6. Reboots
 */

// Config
require('config.php');

if (file_exists("/var/www/html/onlyaudio.cfg")) { 
	echo "Unit is in audio-mode... No need to dl any videos or manifests...";
	exit;
}


$awsS3Url="riseradio.s3.amazonaws.com";
// 1. Dial into the manifest server
$manifest_server = $config['SERVER_IP'];
$myHostname=gethostname(); // echo $myHostname;
// orig way   $manifest_url = "manifest/unit/".$config['UNIT_KEY'];
$manifest_url = "manifest/unit/".$myHostname;// new way biffo

// 2. Get the JSON manifest
$manifest_full_url = "http://" . $manifest_server . "/" . $manifest_url;
echo "Connecting to: " . $manifest_full_url . "\n";

// die("Outta here...");

$json = file_get_contents("http://" . $manifest_server . "/" . $manifest_url);
$data = json_decode($json);

// 2.5 Save the JSON manifest for local rotation playback
// $fp = fopen('latest_manifest.json', 'w'); // change location
$fp = fopen('/var/www/html/latest_manifest.json', 'w');
fwrite($fp, $json);
fclose($fp);

// 3. Download the new videos into a temporary directory
/*
$conn_id = ftp_connect($manifest_server);
if(!$conn_id) {
    echo "Error: FTP login failed!";
    exit;
}
*/
//$login_result = ftp_login($conn_id, 'ftp', 'Whitesun123');
//ftp_pasv($conn_id, true) or die("Cannot switch to passive mode");
$download_errors = 0;

foreach($data as $type => $type_data) {
    foreach($type_data as $video) {
        $server_path = str_replace("storage/app/user_storage/","",$video->server_path);
      	// Global Ads need to be formatted specifically
      	$path_mod = $video->path;
      	if($type == 'global') {
      		$path_mod = substr($video->tag,0,30) . ".mp4";
      	} // Steve added big else here to stop dling of SPvids
	else {

        	$local_path = "/var/www/html/assets/videos/tmp/" . $path_mod;
        	$possible_path = "/var/www/html/assets/videos/" . $path_mod;

        	if(file_exists ($possible_path) && $video->md5 == md5_file($possible_path)){
          	echo "File on device already, and has matching MD5\n";
          	echo "Keeping: `".$local_path."`\n";
          	rename($possible_path,$local_path);
        	}else{
          	echo "Downloading: `".$server_path."` -> `".$local_path."... \n";
          	$command = "/usr/bin/wget \"http://" . $awsS3Url . "/storage/app/user_storage/".$server_path."\" -O \"".$local_path."\"";
          	//echo $command;
          	exec($command);
          	//exit;
          	/*
          	if(ftp_get($conn_id, $local_path, $server_path, FTP_BINARY)) {
              	echo "Successfully written to `".$local_path."`!\n";
         	 } else {
        	      echo "Error\n";
       		   }*/
	        }
	}// big else
    }// end of inner foreach
}
if($download_errors) {
    echo "Error: FTP download errors occurred. There were " . $download_errors . " errors.";
    // Clean up tmp directory
    exit;
}
// 3.5 Everything looks good, reporting in to server
//file_get_contents("http://" . $manifest_server . "/checkin/1/true");

// 4. Delete the old videos
// deactivated this line due toSpotlights being killed     -->   exec('find /var/www/html/assets/videos/ -maxdepth 1 -type f -delete');

// 5. Move the new videos to the live directory
exec('mv /var/www/html/assets/videos/tmp/* /var/www/html/assets/videos');

?>
</pre>
