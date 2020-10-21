<?php
$crlf = explode("\n", file_get_contents("https://raw.githubusercontent.com/swisskyrepo/PayloadsAllTheThings/master/CRLF%20Injection/crlfinjection.txt"));

$blacklist = ['%27',"'","<",">","?","../","/","..","","%%2727
%25%27"];
$sec_data = $_REQUEST;
foreach ($sec_data as $value) {
	foreach ($blacklist as $findme) {
	
		if ( (strpos($value,urlencode($findme))!== false) || (strpos($value,$findme)!== false) || (in_array($value, $crlf) )) {
			die("<center> A security injection has been detected :) !");
		}
	}
}

?>