<?php
$addressblock = $_POST['addressblock'];

$output = shell_exec('sudo bash-scripts/dhcpcd-write.sh "'.$addressblock.'"');
echo $output;
?>
