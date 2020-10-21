
<?php
$uid=$_GET["id"];
$data = json_decode(post(URL_API,"admin/places/$uid","","GET",$token));
$data=$data->data;


$d='
<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12" style="margin-left: 20%">


                            <div class="card">
                                <h5 class="card-header">Update place: '.$data->name.'</h5>
                                <div class="card-body">
                                    <form enctype="multipart/form-data" action="#" id="basicform" data-parsley-validate="" method="POST">
                                        <div class="form-group">
                                            <label for="inputUserName">Name:</label>
                                            <input placeholder="'.$data->name.'" id="inputUserName" type="text" name="name" data-parsley-trigger="change" required="" placeholder="Enter place name" autocomplete="off" class="form-control">
                                        </div>
                                         <div class="form-group">
                                            <label for="inputUserName">Address:</label>
                                            <input placeholder="'.$data->adresse.'"id="inputText3" type="text" name="adr" data-parsley-trigger="change" required="" placeholder="Enter address" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Description:</label>
                                            <textarea placeholder="'.$data->description.'" name="dsc" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>Postal Code <small class="text-muted">19000</small></label>
                                            <input placeholder="'.$data->postalCode.'" type="text" name="post" class="form-control "  name="post" >
                                        </div>
                                        <div class="form-group">
                                            <label>Coordonates: <small class="text-muted"></small>x,y</label>
                                           <div>latitude:  <input  placeholder="'.$data->coordonates->latitude.'" type="text" name="x" class="form-control " ></div>
                                          <div>  longitude: <input placeholder="'.$data->coordonates->longitude.'" type="text" name="y" class="form-control "   ></div>
                                        </div>

                                            <div class="form-group">
                            
                                            <h5>Type</h5>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input value="HADJ" type="radio" name="type" checked="" class="custom-control-input"><span class="custom-control-label">Hadj</span>
                                            </label>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input  value="OMRA" type="radio" name="type" class="custom-control-input"><span class="custom-control-label">Omra</span>
                                            </label>
                                            
                                      
                                            

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
                                                    <input name="submit" value="Update place" type="submit" class="btn btn-space btn-primary"></input>
                                                   
                                                </p>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
';
echo $d;



if(isset($_POST["submit"])){
    $pic1=file_get_contents($_FILES["f1"]["tmp_name"]);
    $pic2=file_get_contents($_FILES["f2"]["tmp_name"]);
    $pic3=file_get_contents($_FILES["f3"]["tmp_name"]);
	$data = array("adresse"=>$_POST["adr"],"name"=>$_POST["name"],"description"=>$_POST["dsc"],"coordonates"=>array('latitude' =>$_POST["x"],'longitude' =>$_POST["y"] ),"type"=>$_POST["type"],"postalCode"=>$_POST["post"],"pictures"=>array("data:image/png;base64, ".base64_encode($pic2),"data:image/png;base64, ".base64_encode($pic1),"data:image/png;base64, ".base64_encode($pic3)));
    

	$rez = json_decode(post(URL_API,"admin/places/$uid",json_encode($data),"PATCH",$token));
    
	
	if ($rez->succes==true) {
        session_unset("places");
		echo "<script>alert('Place updated Successfuly')</script>";
	}else{
		echo "<script>alert('Please check your inputs')</script>";
	}
}
?>