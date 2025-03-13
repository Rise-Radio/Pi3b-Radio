<?php
  $offset = $_GET['offset'];
	$output = shell_exec('sudo bash-scripts/audio-offset-write.sh "'.$offset.'"');
	echo $output;
?>
