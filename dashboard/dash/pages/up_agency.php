<?php
$uid=$_GET["id"];
$data = json_decode(post(URL_API,"admin/agency/$uid","","GET",$token));
$data=$data->data;
?>
<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12" style="margin-left: 20%">
                            <div class="card">
                                <h5 class="card-header">Update  agency</h5>
                                <?php
                                $d='
                                <div class="card-body">
                                    <form enctype="multipart/form-data" action="#" id="basicform" data-parsley-validate="" method="POST">
                                        <div class="form-group">
                                            <label for="inputUserName">Name: </label>
                                            <input placeholder="'.$data->name.'" id="inputUserName" type="text" name="name" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                         <div class="form-group">
                                            <label for="inputUserName">Address:</label>
                                            <input placeholder="'.$data->adress.'" id="inputText3" type="text" name="adr" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Description:</label>
                                            <textarea placeholder="'.$data->discription.'" name="dsc" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>Phone <small class="text-muted">(999) 999-9999</small></label>
                                            <input  placeholder="'.$data->phone.'" type="text" name="phone" class="form-control phone-inputmask" id="phone-mask" name="phone" >
                                        </div>




                         


                                        <div class="form-group">
                                            <label for="inputEmail">Email address:</label>
                                            <input placeholder="'.$data->email.'" id="inputEmail" type="email" name="email" data-parsley-trigger="change" required="" placeholder="Enter email" autocomplete="off" class="form-control">
                                        </div>
                                            <label for="inputEmail">Price:</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend"><span class="input-group-text">DZD</span></div>
                                                <input placeholder="'.$data->priceRange.'" name="price" type="text" class="form-control">
                                                <div class="input-group-append"><span class="input-group-text">.00</span></div>
                                            </div>
                                         <div class="form-group">
                                            <label for="inputUserName">Opening Houre:</label>
                                            <input placeholder="'.$data->openingHours.'" id="inputText3" type="text" name="houre" data-parsley-trigger="change" required="" placeholder="Enter user name" autocomplete="off" class="form-control">
                                        </div>
                                             <label for="inputUserName">Select images to upload:</label>
                                             <div class="form-group">  
                                            
                                       
                                         <div> <input type="file" name="f1" id="fileToUpload"></div>
                                        <div><input type="file" name="f2" id="fileToUpload"></div>
                                        <div><input type="file" name="f3" id="fileToUpload"></div>
                                        
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
                        ';
                        echo $d;
                        ?>


<?php

if(isset($_POST["submit"])){
    $pic1=file_get_contents($_FILES["f1"]["tmp_name"]);
    $pic2=file_get_contents($_FILES["f2"]["tmp_name"]);
    $pic3=file_get_contents($_FILES["f3"]["tmp_name"]);
	$data = array("adress"=>$_POST["adr"],"name"=>$_POST["name"],"discription"=>$_POST["dsc"],"email"=>$_POST["email"],"openingHours"=>$_POST["houre"],"priceRange"=>$_POST["price"],"phone"=>$_POST["phone"],"pictures"=>array("data:image/png;base64, ".base64_encode($pic2),"data:image/png;base64, ".base64_encode($pic1),"data:image/png;base64, ".base64_encode($pic3)));
    

	$rez = json_decode(post(URL_API,"admin/agency/$uid",json_encode($data),"PATCH",$token));
    

	if ($rez->succes==true) {
        session_unset("agency");
		echo "<script>alert('Agency created Successfuly')</script>";
	}else{
		echo "<script>alert('".$rez->message."')</script>";
	}
}
?>