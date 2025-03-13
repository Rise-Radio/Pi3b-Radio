<?php
  shell_exec('sudo pkill omxplayer.bin');
  shell_exec('sudo pkill node');
  shell_exec('sudo pkill CheckNSA.sh');
  shell_exec('sudo sleep 5');
  shell_exec('sudo pkill iceweasel');
  shell_exec('sudo shutdown -h +1');

?>
