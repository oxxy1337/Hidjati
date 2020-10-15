
       <?php
       if (!$_SESSION["isAdmin"]) die(print("<script>alert('Must be an ADMIN !')</script>"));
       
       ?>
        <div class="dashboard-wrapper">
            <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Users </h2>
                         
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Users</a></li>
                                        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-20 col-lg-14 col-md-40 col-sm-20 col-40">
                        <div class="card">
                            <h5 class="card-header">Users List</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
                                        <thead>
                                            <tr>    
                                                <th>Edit</th>
                                                <th>Delete</th>
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>gender</th>
                                                <th>Phone</th>
                                                <th>Created At</th>
                                                <th>Role</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            
                                          $data = json_decode(post(URL_API,"admin/operations","","GET",$token));
                                            //print_r($data);     
                                            foreach ($data->data as $user) {
                                                if($user->isAdmin==true){
                                                    $role="ADMINISTRATOR";
                                                }elseif ($user->isAdmin==false) {
                                                    $role="MANAGER";
                                                }
                                                echo '

                                                        <tr>
                                                        <td>
                                                        <a target="blank" href="?page=edit-manager&id='.$user->_id.'">
                                                        <div class="col-sm-6 col-md-4 col-lg-8 f-icon"><i class="far fa-edit"></i><</div></a>
                                                        </td>
                                                        <td>
                                                        <a target="blank" href="?page=manager&op=delete&id='.$user->_id.'">
                                                        <div class="col-sm-6 col-md-4 col-lg-6 f-icon">
                                                        <i class="fas fa-trash-alt"></i></div><a/>
                                                        </td>
                                                            <td> '.$user->username.'</a></td>
                                                            <td>'.$user->email.'</td>
                                                            
                                                            <td>'.$user->gender.'</td>
                                                            <td>'.$user->phone.'</td>
                                                            <td>'.explode("T",$user->createdAt)[0].'</td>
                                                            <td>'.$role.'</td>
                                                        </tr>
                                                    


                                                ';
                                            }
                                            
                                           ?>
                                        </tbody>
                                        <tfoot>
                                                  <tr>  
                                                <th>Edit</th>  
                                                <th>Delete</th>
                                                <th>Username</th>
                                                <th>Email</th>
                                            
                                                <th>gender</th>
                                                <th>Phone</th>
                                                <th>Created At </th>
                                                <th>Role</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
                </div>
                

                    <!-- ============================================================== -->
                    <!-- end data table multiselects  -->
                    <!-- ============================================================== -->
                </div>
            </div>
            
<?php
if ($_GET["op"]=="delete") {
    session_unset("admins");
    $rez = json_decode(post(URL_API,"admin/operations/".$_GET["id"],"","DELETE",$token));
   
    if($rez->succes == true){
        echo "<script>alert('User Deleted Successfuly !')</script>";
    }else{
        echo "<script>alert('".$rez->message."')";
    }
}
?>