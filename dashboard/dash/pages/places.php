<?php
$places = json_decode(post(URL_API,"admin/places","","GET",$token));
$places=$places->data;



?>
        <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Places </h2>
                         
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Places List</a></li>
                                        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="row">  
                <?php 
             foreach ($places as $place) {
             	$img = ["","",""];
             	for($i=0;$i<3;$i++)
               		{
               			if($place->pictures[$i] == "") {
               			$img[$i]="https://images.surfacemag.com/app/uploads/2017/04/Black-Screen.jpg";
               			}else{
               				$img[$i]=$place->pictures[$i];
               			}
               		}
                	$d='
             	
        <div class="col-sm-6  ">
                        <div class="card">
                            <h5 class="card-header">'.$place->name.'</h5>
                            <div class="card-body">
                            	<a href="?page=edit-place&id='.$place->_id.'" >
                            	<i class="far fa-edit">Edit </i></a>
                            	<a href="?page=places&op=delete&id='.$place->_id.'">Delete
                                  <i class="fas fa-trash-alt"></i><a/>
                                <div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators1" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators1" data-slide-to="1" class=""></li>
                                        <li data-target="#carouselExampleIndicators1" data-slide-to="2" class=""></li>
                                    </ol>


                                    
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" width="500" height="200" src="'.$img[0].'" alt="First slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h1 class="text-black">'.$place->name.'</h1>
                                                <h3>'.$place->description.'</h3>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" width="500" height="200" src="'.$img[1].'"  alt="Second slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h1 class="text-white">'.$place->name.'</h1>
                                                 <h3>'.$place->description.'</h3>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" width="500" height="200" src="'.$img[2].'"  alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                 <h1 class="text-white">'.$place->name.'</h1>
                                                 <h3>'.$place->description.'</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                       <span class="sr-only">Previous</span>  </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>  </a>
                                </div>
                            </div>
                        </div>
                    </div>
               
                ';
                echo $d;
            }
            echo "</div>";
                

            if ($_GET["op"]=="delete") {
                $uid=$_GET["id"];
                $rez = json_decode(post(URL_API,"admin/places/$uid","","DELETE",$_SESSION["jwt"]));
                if ($rez->succes==true) {
                  session_unset("places");
                    echo '<script>alert("Place deleted successfuly  !")</script>';
                }
            }