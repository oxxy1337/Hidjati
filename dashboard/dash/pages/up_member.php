<?php
$uid=$_GET["id"];
$user = json_decode(post(URL_API,"admin/users/$uid","","GET",$token));
$user=$user->data;


?>
<div class="row">

                   
<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
	
                            <div class="card">
                                <h5 class="card-header"><?php echo $user->username ; ?> | User Data</h5>
                                <div class="card-body">
                                    <form action="#" id="basicform" data-parsley-validate="" method="POST">
                                    	<?php
                                    	$d='
                                        <div class="form-group">
                                            <label for="inputUserName">User Name</label>
                                            <input placeholder="'.$user->username.'" id="inputUserName" type="text" name="username" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                         <div class="form-group">
                                            <label for="inputUserName">First name</label>
                                            <input id="inputText3" type="text" name="fname" data-parsley-trigger="change" required="" placeholder="'.$user->first_name.'" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputUserName">Last name</label>
                                            <input id="inputText3" type="text" name="lname" data-parsley-trigger="change" required="" placeholder="'.$user->last_name.'" autocomplete="off" class="form-control">
                                        </div>

                                        <div class="form-group">
                                            <label>Phone <small class="text-muted">(999) 999-9999</small></label>
                                            <input  placeholder="'.$user->phone.'"  type="text" name="phone" class="form-control phone-inputmask" id="phone-mask" name="phone" >
                                        </div>




                       


                                        <div class="form-group">
                                            <label for="inputEmail">Email address</label>
                                            <input placeholder="'.$user->email.'" id="inputEmail" type="email" name="email" data-parsley-trigger="change" required="" placeholder="Enter email" autocomplete="off" class="form-control">
                                        </div>
                                        
                                        <div class="row">
                                            
                                            <div class="col-sm-6 pl-0">
                                                <p class="text-right">
                                                    <input name="submit" value="Add User" type="submit" class="btn btn-space btn-primary"></input>
                                                   
                                                </p>
                                            </div>
                                            ';
                                            echo $d;
                                            ?>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <?php
                        $dd='
                        <div class="col-xl-6 col-lg-4 col-md-12 col-sm-14 col-18">
                            <div class="card card-fluid">
                                <!-- .card-body -->
                                <div class="card-body text-center">
                                    <!-- .user-avatar -->
                                    <a href="user-profile.html" class="user-avatar my-3">
                                  <img src="'.$user->iconUrl.'" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                   </a>
                                    <!-- /.user-avatar -->
                                   <h3>Created At </a>
                                   '.$user->createdAt.'
                                    
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        ';
                        echo $dd
                        ?>

 </div>

<?php

if(isset($_POST["submit"])){
	$data = array("username"=>$_POST["username"],"email"=>$_POST["email"],"first_name"=>$_POST["fname"],"last_name"=>$_POST["lname"],"phone"=>$_POST["phone"]);

	$data=json_encode($data);
	$rez = json_decode(post(URL_API,"admin/users/$uid",$data,"PATCH",$token));
	
	if ($rez->succes==true) {
        session_unset("users");
		echo "<script>alert('User Updated Successfuly')</script>";
	}else{
		echo "<script>alert('".$rez->message."')</script>";
	}
}
?>