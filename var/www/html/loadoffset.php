<?php
if (filesize("./offset.cfg") < 1) {
	$data=250;
}
else {
	$fp=fopen("./offset.cfg", "r");
	$data=fgets($fp);
	fclose($fp);
}
print_r($data);
?>
