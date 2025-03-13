<?php
	$command = $_GET['what'];

	if ($command == 'stop'){
		//kill node .....
		$output = shell_exec('sudo bash-scripts/stop-audio.sh');
	}

	if ($command == 'start'){
		//run node .....
		$output = shell_exec('sudo -u pi bash-scripts/start-audio.sh');
	}
	echo $output;
?>
