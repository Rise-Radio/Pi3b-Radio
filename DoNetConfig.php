<?php
// DoNetConfig.php for DIBTV R-Pi by Steve Wilson

$wpaSupStart="ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev\nupdate_config=1\ncountry=US\n\nnetwork={\n";
$mySSID="";
$myPSK="";
$myKEY_MGMT="";

$dhcpcdHead="hostname\nclientid\npersistent\noption rapid_commit\noption domain_name_servers, domain_name, domain_search, host_name\noption classless_static_routes\noption ntp_servers\nrequire dhcp_server_identifier\nslaac private\nnohook lookup-hostname\n\n";
$myEth0Routers="";
$myEth0DNS="";
$myWlan0Routers="";
$myWlan0DNS="";
$myIP="";
$myAudioIP="";
$IsAudioMaster=false;
$IsEth0=false;//set when read


function rsearch($folder, $pattern) {
    $iti = new RecursiveDirectoryIterator($folder);
    foreach(new RecursiveIteratorIterator($iti) as $file){
         if(strpos($file , $pattern) !== false){
            return $file;
         }
    }
    return false;
}

// Start of main loop
$myHostName = gethostname();
$myUnitID= strtoupper(substr($myHostName,-3));
$tmp=substr($myUnitID,1,1);
if ($tmp === "A" ) {
  $myUnitID="A01";
  $IsAudioMaster=true;
}
elseif ($tmp === "V" ) {
  $myUnitID="V0" . substr($myUnitID, -1);//skip first 2 chars
}
else {
  $myUnitID="V10";
}

// $myUnitID="V10";

$rebootFileName = "/home/pi/RequestReboot.txt";
// get config file
$fullConfigFilePathAndName = rsearch('/media/pi/', "/DIBTVNetConfig.cfg");

if (file_exists($fullConfigFilePathAndName) ) {
  echo "Found file at " . $fullConfigFilePathAndName ."\n";
  $configDateFile=  str_replace("DIBTVNetConfig.cfg",$myHostName . "-LastDIBTVNetUpdate.txt",$fullConfigFilePathAndName);
  
  if (file_exists($configDateFile)) {
  	$elapsedTime = filemtime($configDateFile) + 10000;
  	if ($elapsedTime >= time() ) {  //bail out
  	  	if (file_exists($rebootFileName)) { 
  	  		unlink($rebootFileName); // signal shell to cancel reboot
  	  	}
  	  	die("Not enough time elapsed to do NetUpdate... Skipping...");  	  	
  	}
  	else {
  	  echo "Enough time elapsed, so doing process...\n";  
  	}
  }

  $cfgFile = fopen($fullConfigFilePathAndName,"r") or die("Couldn't open config-file...");
  while(!feof($cfgFile)) {
    $myLine=ltrim(fgets($cfgFile));
    if (( strlen($myLine) > 0) && (strpos($myLine,"#") !== 0 )) {
        echo "Processing line: " . $myLine . "\n";
        $tmp=substr($myLine,0,3);
        if ($tmp === "IP-") { // process IPs 
		$tmp=substr($myLine,3,3);// get UnitID for IP
		if ($tmp === "A01") {
			$myAudioIP=trim(substr($myLine,7,strlen($myLine) - 13));//7+5+1=13
			if ($IsAudioMaster) {
				$myIP=trim(substr($myLine,7,strlen($myLine) - 8));
			}
		}
		elseif ($tmp === $myUnitID) {
			$myIP=trim(substr($myLine,7,strlen($myLine) - 8));
		}
        }
        else { // process other stuff 
		if ( substr($myLine,0,9) === "WPA-SSID=" ) {
			$mySSID=trim(substr($myLine,9));
		}
		elseif ( substr($myLine,0,8) === "WPA-PSK=" ) {
			$myPSK=trim(substr($myLine,8));
		}
		elseif ( substr($myLine,0,13) === "WPA-KEY_MGMT=" ) {
			$myKEY_MGMT=trim(substr($myLine,13));
		}
		elseif ( substr($myLine,0,13) === "ETH0-ROUTERS=" ) {
			$myEth0Routers=trim(substr($myLine,13));
		}
		elseif ( substr($myLine,0,9) === "ETH0-DNS=" ) {
			$myEth0DNS=trim(substr($myLine,9));
		}
		elseif ( substr($myLine,0,14) === "WLAN0-ROUTERS=" ) {
			$myWlan0Routers=trim(substr($myLine,14));
		}
		elseif ( substr($myLine,0,10) === "WLAN0-DNS=" ) {
			$myWlan0DNS=trim(substr($myLine,10));
		}
	}        
    } // if not a blank line

  } // end of while
  fclose($cfgFile);

  // Now mark time of update
  $fp = fopen($configDateFile,"w");
  fwrite($fp, "Net config updated for " . $myHostName . " on ". date("m/d/Y") . " at " . date("h:i:sa") );
  fclose($fp);
  // Now signal parent script to do reboot
  $fp = fopen($rebootFileName,"w");
  fwrite($fp, "Request reboot for " . $myHostName . " on ". date("m/d/Y") . " at " . date("h:i:sa") );
  fclose($fp);

// create the WPA_supplicant file
  $fp = fopen("/boot/wpa_supplicant.conf","w");
  fwrite($fp,$wpaSupStart);// write header
  fwrite($fp,'ssid="' . $mySSID . '"' .PHP_EOL);
  fwrite($fp,'psk="' . $myPSK . '"'.PHP_EOL);
  fwrite($fp,'key_mgmt=' . $myKEY_MGMT .PHP_EOL);
  fwrite($fp,'}'.PHP_EOL);
  fclose($fp);

// create the dhcpcd.conf file
  $fp = fopen("/etc/dhcpcd.conf","w");
  fwrite($fp,$dhcpcdHead);// write header
  $tmp=substr($myIP,-1);
  $myIP=substr($myIP,0,strlen($myIP) - 2);
  if ( $tmp === "E") { //Do Eth0
	fwrite($fp,PHP_EOL . PHP_EOL . 'interface eth0'.PHP_EOL.PHP_EOL);
	fwrite($fp,'static ip_address=' . $myIP .PHP_EOL);
	fwrite($fp,'static routers=' . $myEth0Routers .PHP_EOL);
	fwrite($fp,'static domain_name_servers=' . $myEth0DNS .PHP_EOL.PHP_EOL);
  }
  else { // Do Wlan0
	fwrite($fp,PHP_EOL.PHP_EOL . 'interface wlan0'.PHP_EOL.PHP_EOL);
	fwrite($fp,'static ip_address=' . $myIP .PHP_EOL);
	fwrite($fp,'static routers=' . $myWlan0Routers .PHP_EOL);
	fwrite($fp,'static domain_name_servers=' . $myWlan0DNS .PHP_EOL.PHP_EOL);
  }
  fclose($fp);

  // write AudioIP to video.js
   if (!$IsAudioMaster) { // a video unit
	// create the config.js file for video units
  	$fp = fopen("/var/www/html/assets/nodeserver/config.js","w");
  	fwrite($fp,"var myconfig = {};" . PHP_EOL);
  	fwrite($fp,"myconfig.nodeport = 8888;" . PHP_EOL);
  	fwrite($fp,"myconfig.audmasterIP = '" . $myAudioIP . "';" . PHP_EOL);
  	fwrite($fp,"module.exports = myconfig;" . PHP_EOL);
  	fwrite($fp,PHP_EOL);
  	fclose($fp);
   }// End of Is Video Unit

}// end of Do The Process
else {
  echo "No NetConfig.cfg file was found...";
  }
//end of process




?>

