<?php

// separate Aunits from Vunits!
$UseAudioUnitCodeBase = true;  // set to false if it is a video unit.
$UsePassiveMode = false;
$ftp_server = "codebase.doitbestradio.com";
$ftp_user_name="dibtvunit";
 $ftp_user_pass="2P#Mfsa78!";
 $errorDescr = "";
$upload=false;
$processResults = "";
$tmp="";
$fileArray = array();
$numFileEntries=0;

$MyPiHostName = mb_strtoupper(trim(gethostname()));
date_default_timezone_set("America/Chicago");

// connect to FTP
$conn_id = ftp_connect($ftp_server); 
// login with username and password
$login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass); 

// check connection
if ((!$conn_id) || (!$login_result)) { 
    echo "Failed to connect to $ftp_server for user $ftp_user_name\n"; 
    exit; 
} else {
    echo "Connected to $ftp_server, for user $ftp_user_name\n";
}
if ( $UsePassiveMode) {
	if (ftp_pasv($conn_id, true)) { 
		echo "Entered Passive Mode\n"; 
	} 
	else { 
		echo "Failed to enter Passive mode\n";
	}
}
else {
	if (ftp_pasv($conn_id, false)) { 
		echo "Entered Active Mode\n"; 
	} 
	else { 
		echo "Failed to enter Active mode\n";
	}
}

// get permitted Pis list file
$FoundMyPi=false;
if (ftp_get($conn_id, "/var/www/html/pis2dl.txt", "/pis2dl.txt", FTP_ASCII)) {
	if ($fh = fopen("/var/www/html/pis2dl.txt" ,"r")){
	    while (($buffer = fgets($fh, 4096)) !== false) {
	    	$buffer = mb_strtoupper(trim($buffer));
		  if (($buffer === $MyPiHostName) || ($buffer === "ALLPISMAYDL")) {
		  	$FoundMyPi = true;
		  	echo "Found My Pi!\n";
		  	break;
		  }
	    }
	    fclose($fh);
	}
} 
else {
	$tmp = "Could not get Pi-List!\n";
    $processResults = $processResults . $tmp;
    $errorDescr = $errorDescr . $tmp;
    echo $tmp;
}

if ($FoundMyPi) { // Do the update

  //get code-file list to download
  if ($UseAudioUnitCodeBase) $codemanifest="aunitfiles2dl.txt"; 
  else $codemanifest="vunitfiles2dl.txt";
	  if (ftp_get($conn_id, "/var/www/html/" . $codemanifest, "/" . $codemanifest, FTP_ASCII)) {
		if ($fh = fopen("/var/www/html/" . $codemanifest ,"r")){
		    while (($buffer = fgets($fh, 4096)) !== false) {
		    	// process each file
		    	$buffer = trim($buffer);
			  if ( (mb_strpos($buffer,"#") === 0) || (mb_substr($buffer,-4) !==".new" ) ) { //not a filename that ends with .new
				// echo "Found a comment: " . $buffer . "\n";
			  }
			  else {  // its a real file
			  	// check date
			  	$tmp = ftp_mdtm($conn_id, $buffer);// get remote filedate 
			  	$localfile = mb_substr($buffer,0, mb_strlen($buffer) - 4);
			  	if ( file_exists($localfile) )  $localfiledate = filemtime($localfile);
			  	else $localfiledate = 0;
				if ($tmp > $localfiledate) echo "Downloading new file: " . $buffer . "\n";
				else {
					echo "Ignoring older file $buffer \n";
					continue;
				}
			  	
			  	if (ftp_get($conn_id, $buffer, $buffer, FTP_ASCII))  {
			  		$fileArray[$numFileEntries++] = $buffer;
			  		$processResults = $processResults . "Downloaded " . $buffer . "\n";
			  	}
			  	else {
			  		$tmp =  "FAILED to download " . $buffer . "\n";
			  		$processResults = $processResults . $tmp;
			  		$errorDescr=$errorDescr . $tmp;
			  	}
			  }
		    }
		    fclose($fh);
		}
	} 
	else {
		$tmp =  "Could not Download Pi-List!\n";
		$processResults = $processResults . $tmp;
		$errorDescr=$errorDescr . $tmp;
	    echo $tmp;
	}
  //download each file

} // end of Found My Pi
else { // Pi Not Found
	echo "Didn't find my Pi in list...\n";
	$processResults = "Pi NOT found in Allowed DL list...\n";
}

$processResults = $processResults . "\n\nLogged in on " . date(DATE_RSS);

// save logfile of results...
$source_logfile= $MyPiHostName . ".log";
$destination_logfile = "/pilogs/" . $source_logfile;
$source_logfile="/var/www/html/" . $source_logfile;

// create file
if ($fh = fopen($source_logfile ,'w')){
    fwrite($fh, $processResults);
    fclose($fh);
}
$upload = ftp_put($conn_id, $destination_logfile, $source_logfile, FTP_ASCII); //FTP_BINARY

// check upload status
if (!$upload) { 
    echo "FTP upload has failed!";
} else {
    echo "Uploaded $source_logfile to $ftp_server as $destination_logfile \n";
}

// close the FTP stream 
ftp_close($conn_id); 

if (mb_strlen($errorDescr) > 3) {
	// there were errors so dont change existing files
	echo $errorDescr;
	exit;
}
else {
	// there were NO errors so change existing files
	if ($numFileEntries > 0) {
		echo "Activating new code files...\n"; 
	}
	else {
		echo "No new code files to activate...\n";
	}
	foreach ( $fileArray as $fn ) {
		$tmp = mb_substr($fn,0, mb_strlen($fn) - 4);
		echo $tmp . "\n";
		if (file_exists($tmp . ".old")) {
			unlink($tmp . ".old");
		}
		if (file_exists($tmp)) {
			rename($tmp, $tmp . ".old");
		}
		if (file_exists($tmp . ".new")) {
			rename($tmp . ".new", $tmp);
		}
	}

	exit;
}




?>
