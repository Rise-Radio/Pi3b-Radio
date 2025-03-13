<?php

//edited by Steve took too muchtime afterlog got long

  $log = $_REQUEST['message'].PHP_EOL;
  if (is_dir('logs')){
   file_put_contents('logs/log_'.date("j.n.Y").'.txt', $log, FILE_APPEND);
    echo "Ok";
  }else{
    echo "Not Directory";
    mkdir('logs');
  }

?>
