<?php
	$myoffset=$_GET['offset'];
	$fp=fopen("./offset.cfg","w");
	fwrite($fp,$myoffset);
	fclose($fp);
?>
