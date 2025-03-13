<?php
  $level = $_GET['level'];
	$output = shell_exec('sudo bash-scripts/audio-level-set.sh "'.$level.'"');
	echo $output;
?>
