<?php
if (filesize("./loadmode.cfg") < 1) {
	$data=P; // Production mode;
}
else {
	$fp=fopen("./loadmode.cfg", "r"); // contains either P or D (production or debug mode
	$data=fgets($fp);
	fclose($fp);
}
print_r($data);
?>
