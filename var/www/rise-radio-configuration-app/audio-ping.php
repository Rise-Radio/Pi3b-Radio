<?php
  $ip = $_GET['ip'];
	$output = shell_exec('sudo bash-scripts/audio-ping.sh "'.$ip.'"');
	echo $output;
?>
