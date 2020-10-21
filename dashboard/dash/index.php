<?php
session_start();
error_reporting(0);
//include("../core/waf.php");
if(($_SESSION["log"]!== "ok") && ($_SESSION["jwt"]!=="") ) die(print('<script>alert("Please login again"); window.location.replace("../login");</script>')); 
include("../core/cnf.php");
include("../core/funcs.php");
$data = $_SESSION["data"];
$token = $_SESSION["jwt"];
//echo "$token";
?>            

<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <script src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
    <script src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
    <title>Hidjati - Dashboard</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="#">
                     <svg height="25pt" viewBox="0 -14 512 512" width="30pt" xmlns="http://www.w3.org/2000/svg"><path d="m0 381.652344v26.890625c0 4.953125 3.335938 9.28125 8.121094 10.546875l245.089844 64.824218c1.8125.480469 3.734374.484376 5.578124 0 0 0 234.144532-61.929687 245.089844-64.824218 4.785156-1.265625 8.121094-5.59375 8.121094-10.546875v-26.890625zm0 0" fill="#ebe1dc"/><path d="m256 484.277344c.9375 0 1.875-.121094 2.789062-.363282l147.574219-39.03125 97.515625-25.792968c4.785156-1.265625 8.121094-5.59375 8.121094-10.546875v-26.890625h-256zm0 0" fill="#dcd2cd"/><path d="m0 163.40625v218.246094l256 59.046875 256-59.046875v-218.246094l-256-35.371094zm0 0" fill="#a49ca7"/><path d="m503.882812 65.1875-245.09375-64.824219c-1.828124-.484375-3.75-.484375-5.578124 0l-245.09375 64.824219c-4.785157 1.261719-8.117188 5.59375-8.117188 10.542969v54.773437l256-41.472656 256 41.472656v-54.773437c0-4.949219-3.332031-9.28125-8.117188-10.542969zm0 0" fill="#a49ca7"/><path d="m512 381.652344-256 59.046875v-440.699219c.9375 0 1.875.121094 2.789062.363281l245.09375 64.824219c4.78125 1.261719 8.117188 5.59375 8.117188 10.539062zm-256-250.617188 147.914062 6.902344 108.085938 25.46875v-32.902344l-108.085938-7.566406-147.914062-36.90625zm0 0" fill="#8e8391"/><path d="m375.175781 182.734375-74.152343-6.117187c-2.332032-.191407-4.332032 1.648437-4.332032 3.984374v210.582032c0 2.507812 2.28125 4.394531 4.746094 3.929687l74.15625-14.070312c1.886719-.355469 3.253906-2.007813 3.253906-3.929688v-190.390625c0-2.082031-1.59375-3.816406-3.671875-3.988281zm0 0" fill="#ffd508"/><path d="m256 131.035156-256 32.371094v-32.902344l256-44.472656 4.207031 24.085938zm0 0" fill="#ffe565"/><path d="m512 194.011719-79.113281-6.523438c-2.105469-.171875-3.910157 1.488281-3.910157 3.601563v27.75c0 1.945312 1.539063 3.539062 3.476563 3.613281l79.546875 2.96875zm0 0" fill="#ffd508"/><g fill="#ffe565"><path d="m0 194.011719v31.410156l47.722656-1.78125c1.941406-.074219 3.476563-1.667969 3.476563-3.613281v-26.3125c0-2.113282-1.804688-3.773438-3.910157-3.601563zm0 0"/><path d="m102.398438 188.894531v28.953125c0 2.046875 1.703124 3.6875 3.75 3.613282l43.972656-1.644532c1.941406-.074218 3.480468-1.667968 3.480468-3.609375v-30.9375c0-2.113281-1.804687-3.773437-3.910156-3.601562l-43.976562 3.625c-1.871094.15625-3.316406 1.722656-3.316406 3.601562zm0 0"/><path d="m208.546875 217.636719 47.453125-1.773438v-42.960937l-47.882812 3.949218c-1.875.152344-3.316407 1.71875-3.316407 3.597657v33.574219c0 2.050781 1.699219 3.6875 3.746094 3.613281zm0 0"/><path d="m84.527344 204.539062c0 4.265626-3.460938 7.726563-7.726563 7.726563-4.269531 0-7.726562-3.460937-7.726562-7.726563 0-4.265624 3.457031-7.726562 7.726562-7.726562 4.265625 0 7.726563 3.460938 7.726563 7.726562zm0 0"/><path d="m186.925781 198.40625c0 4.265625-3.457031 7.726562-7.726562 7.726562-4.265625 0-7.726563-3.460937-7.726563-7.726562 0-4.269531 3.460938-7.726562 7.726563-7.726562 4.269531 0 7.726562 3.457031 7.726562 7.726562zm0 0"/></g><path d="m411.640625 204.539062c0 4.265626-3.460937 7.726563-7.726563 7.726563-4.269531 0-7.726562-3.460937-7.726562-7.726563 0-4.265624 3.457031-7.726562 7.726562-7.726562 4.265626 0 7.726563 3.460938 7.726563 7.726562zm0 0" fill="#ffd508"/><path d="m256 131.035156 256 32.371094v-32.902344l-256-44.472656zm0 0" fill="#ffd508"/></svg>    Hidjati Dashboard</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        
                        
                        
                                
                        
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/user.png" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">
                                        <?php echo $data->username; ?> </h5>
                                   
                                </div>
                                
                                <?php
                                echo '<a class="dropdown-item" href="?page=edit-manager&id='.$data->_id.'"><i class="fas fa-cog mr-2"></i>Setting</a>';
                                ?>
                                <a class="dropdown-item" href="?op=logout"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Users <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    
                                         <ul class="nav flex-column">
                                            
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=add-member">Add User</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=users">Users List</a>
                                        </li>
                                        
                                        <li class="nav-item">
                                            
                                           
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fa fa-fw fa-rocket"></i>Agency</a>
                                <div id="submenu-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=add-agency">Add Agency <span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=agency">Agency List</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
                            
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Places</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=add-place">Add Place</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=places">Place List</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>Feedbacks</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=feeds">Feedback list</a>
                                        </li>
                                       
                                    </ul>
                                </div>
                            </li>


                            <?php if($data->isAdmin) {
                                echo '<li class="nav-divider">
                                Administrators
                            </li>
                           

                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-inbox"></i>Managers  <span class="badge badge-secondary">New</span></a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=manager">Managers List</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="?page=add-manager">Add Manager</a>
                                        </li>
                                        
                                   
                                </div>
                            </li>';
                            } ?>
                            
                        
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    
        <?php
                @$page=$_GET["page"];
                switch ($page) {
                    case 'add-member':
                        include './pages/add_member.php';
                        break;
                    case 'user':
                        include './pages/users.php';
                        break;
                    case 'member':
                        include './pages/up_member.php';
                        break;
                    case 'agency':
                        include './pages/agency.php';
                        break;
                    case 'add-agency':
                        include './pages/add_agency.php';
                        break;
                    case 'edit-agency':
                        include './pages/up_agency.php';
                        break;
                    case 'places':
                        include './pages/places.php';
                        break;
                    case 'add-place':
                        include './pages/add_place.php';
                        break;
                    case 'edit-place':
                        include './pages/up_place.php';
                        break;
                    case 'feeds':
                        include './pages/feed.php';
                        break;
                    case 'manager':
                        include './pages/managers.php';
                        break;
                    case 'add-manager':
                       include './pages/add_manager.php';
                        break;
                    case 'edit-manager':
                       include './pages/up_manager.php';
                        break;
                    case 'state':
                        include './pages/state.php';
                        break;
                    default:
                        include './pages/users.php';
                        break;
                }
                if($_GET["op"] == "logout") {
                    session_unset("log");
                    session_unset("jwt");
                    session_unset("isAdmin");
                    session_unset("data");
                    session_destroy();
                     echo "<script>window.location.replace('../login');</script>";
                }
        ?>

            
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
    
</body>
 
</html>