<?php
$jwt=$_GET["jwt"];


?>

<?php

include("../core/cnf.php"); 
include("../core/funcs.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	<?php 
	$log='<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="POST">
					<span class="login100-form-title p-b-43">
						 Enter your New Password 
					</span>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass1">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pass2">
						<span class="focus-input100"></span>
						<span class="label-input100">Confirm Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
					

						
					</div>
			

					<div class="container-login100-form-btn">
						<input value="Change" name="sub" type="submit" class="login100-form-btn">
							
						</input>
					</div>
					
					

					
				</form>'; 

				echo $log;


				?>

				<div class="login100-more" style="background-image: url('images/logo.png');">
				</div>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>

<?php 
	if(isset($_POST['sub'])){
		if ($_POST["pass1"] == $_POST["pass2"]) {
			
		
				$data = array("password"=>$_POST["pass1"]);
				$out  = json_decode(post(URL_API,"resetpassword/$jwt",json_encode($data),"POST",""));
				
				
				if($out->succes == true){
			
					
					echo '<script>alert("Password Changed !"); window.location.replace("./");</script>';
					
				}
				else{
				echo '<script>alert("Not permited");</script>';
				}
		}else{
			echo'<script>alert("Password missmatch");</script>';
		}


	}



	


;?>
	
