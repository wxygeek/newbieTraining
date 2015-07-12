<?php
    set_time_limit(0);
    $i=0;
    $url='http://today.hit.edu.cn/commend/114154_1.htm';
    do{
      $a = rand(1, 255);
      $b = rand(1, 255);
      $c = rand(1, 50);
      $d = rand(1, 255);
      $ip = "$a.$b.$c.$d";
      $ch = curl_init();
      curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR:'.$ip,'CLIENT-IP:'.$ip));
      curl_setopt($ch, CURLOPT_HEADER,1);
      curl_setopt($ch, CURLOPT_URL, $url);
      sleep(2);
      $i++;
      $out = curl_exec($ch);
      curl_close($ch);
    }while($i<=100);
?>
