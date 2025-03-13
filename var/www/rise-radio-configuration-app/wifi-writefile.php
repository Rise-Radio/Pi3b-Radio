<?php
$ssid = $_POST['ssid'];
$psk = $_POST['psk'];
$mgt = $_POST['mgt'];

$output = shell_exec('sudo bash-scripts/wifi-writefile.sh "'.$ssid.'" "'.$psk.'" "'.$mgt.'"');
echo $output;
?>
