<?php
function post($link,$route,$data,$method,$token){
	
	if(($method == "POST") || ($method == "PATCH")) {
		$postdata = $data;

	}elseif (($method == "GET") || ($method=="DELETE")) {
		$postdata=null;
	}
	
	
	//$postdata = $data;
	$opts = array('http' =>
	    array(
	        'method'  => $method,
	        'header'  => "Content-Type: application/json\nAuth: $token\napikey: 123456789",
	        'content' => $postdata
	    )
	);

	$context  = stream_context_create($opts);

	$result = file_get_contents("$link/$route", false, $context);
	return $result;
}
?>