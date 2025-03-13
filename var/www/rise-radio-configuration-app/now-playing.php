<?php
	$command = $_GET['what'];

	if ($command == 'setaudio'){

		shell_exec('sudo bash-scripts/set-songtitle.sh "'.$_GET['title'].'"');
	}

	if ($command == 'getaudio'){

		echo shell_exec('sudo bash-scripts/get-songtitle.sh');

	}

	if ($command == 'video'){
		//ps aux with grep to get current video name
		$output = shell_exec('sudo bash-scripts/now-playing.sh');
	}
	echo $output;
?>
