<?php
if (filesize("./DIBsyskey.cfg") < 1) {
	$data="nopass";
}
else {
	$fp=fopen("./DIBsyskey.cfg", "r");
	$data=trim(fgets($fp));
	fclose($fp);
}
print_r($data);
?>
