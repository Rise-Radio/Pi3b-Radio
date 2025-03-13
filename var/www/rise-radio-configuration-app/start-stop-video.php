<?php
	$command = $_GET['what'];

	if ($command == 'stop'){
		//kill node .....
		$output = shell_exec('sudo bash-scripts/stop-video.sh');
	}

	if ($command == 'start'){
		//run node ..... 
		$output = shell_exec('sudo bash-scripts/start-video.sh');
	}
	echo $output;
?>
