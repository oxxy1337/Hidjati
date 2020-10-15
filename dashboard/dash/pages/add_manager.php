       <?php
       if (!$_SESSION["isAdmin"]) die(print("<script>alert('Must be an ADMIN !')</script>"));
       
       ?>

<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 " style="margin-left: 20%">
                            <div class="card">
                                <h5 class="card-header">User Data</h5>
                                <div class="card-body">
                                    <form action="#" id="basicform" data-parsley-validate="" method="POST">
                                        <div class="form-group">
                                            <label for="inputUserName">User Name</label>
                                            <input id="inputUserName" type="text" name="username" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                         <div class="form-group">
                                            <label for="inputUserName">First name</label>
                                            <input id="inputText3" type="text" name="fname" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputUserName">Last name</label>
                                            <input id="inputText3" type="text" name="lname" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>

                                        <div class="form-group">
                                            <label>Phone <small class="text-muted">(999) 999-9999</small></label>
                                            <input  type="text" name="phone" class="form-control phone-inputmask" id="phone-mask" name="phone" >
                                        </div>




                         <div class="form-group">
                            
                                            <h5>Gender</h5>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input value="male" type="radio" name="1" checked="" class="custom-control-input"><span class="custom-control-label">Male</span>
                                            </label>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input  value="female" type="radio" name="1" class="custom-control-input"><span class="custom-control-label">Female</span>
                                            </label>
                                            
                                      
                                            

										</div>


                                        <div class="form-group">
                                            <label for="inputEmail">Email address</label>
                                            <input id="inputEmail" type="email" name="email" data-parsley-trigger="change" required="" placeholder="Enter email" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword">Password</label>
                                            <input name="pass" id="inputPassword" type="password" placeholder="Password" required="" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputRepeatPassword">Repeat Password</label>
                                            <input name="pass2" id="inputRepeatPassword" data-parsley-equalto="#inputPassword" type="password" required="" placeholder="Password" class="form-control">
                                        </div>
                                            
                                            <div class="custom-control custom-radio">
                                                <input value="false" type="radio" class="custom-control-input is-valid" id="customControlValidation3" name="is" required>
                                                <label class="custom-control-label" for="customControlValidation3">Manager Controle</label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input value="true" type="radio" class="custom-control-input is-invalid" id="customControlValidation4" name="is" required>
                                                <label class="custom-control-label" for="customControlValidation4">Full Control</label>
                                            </div>
                                        <div class="row">
                                            
                                            <div class="col-sm-6 pl-0">
                                                <p class="text-right">
                                                    <input name="submit" value="Add User" type="submit" class="btn btn-space btn-primary"></input>
                                                   
                                                </p>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


<?php

if(isset($_POST["submit"])){
	$data = array("isAdmin"=>$_POST["is"],"password"=>$_POST["pass"],"username"=>$_POST["username"],"email"=>$_POST["email"],"first_name"=>$_POST["fname"],"last_name"=>$_POST["lname"],"gender"=>$_POST["1"],"confirmed"=>true,"phone"=>$_POST["phone"]);

    


	$rez = json_decode(post(URL_API,"admin/operations",json_encode($data),"POST",$token));

	if ($rez->succes==true) {
        session_unset("admins");
		echo "<script>alert('User created Successfuly')</script>";
	}else{
		echo "<script>alert('".$rez->message."')</script>";
	}
}
?>