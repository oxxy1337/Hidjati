
<?php
error_reporting(0);
$data = json_decode(post(URL_API,"admin/feedbacks","","GET",$token));
$data=$data->data;

?>
<div class="dashboard-wrapper">
            <div class="main-container">
                <div class="navbar bg-white breadcrumb-bar border-bottom">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Feedbacks</a>
                            </li>

                        </ol>
                    </nav>
                    
                </div></div>
                <div class="content-container">
                    <div class="chat-module">
                        <div class="chat-module-top">
                            <div class="chat-module-body">
                            <?php
                            foreach ($data as $feed) {
                            switch ($feed->note) {
                                    case '0':
                                      $star='';
                                      break;
                                  case '1':
                                      $star='<i class="fas fa-star"></i>';
                                      break;
                                  case '2':
                                      $star='<i class="fas fa-star"></i><i class="fas fa-star"></i>';
                                      break;
                                    case '3':
                                      $star='<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>';
                                      break;
                                    case '4':
                                      $star='<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>';
                                      break;
                                    case '5':
                                      $star='<i class="fas fa-star"></i><i class="fas fa-star"></i>';
                                      break;
                                  default:
                                      # code...
                                      break;
                              }  
                            $uid = $feed->author_id;
                            $user = json_decode(post(URL_API,"admin/users/$uid","","GET",$_SESSION["token"]));
                            $user=$user->data;
                            
                             $d='   
                            
                                <div class="media chat-item">
                                    <img alt="'.$user->username.'" src="'.$user->picturesUrls[0].'" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                           <a href="?page=member&id='.$uid.'"> <span class="chat-item-author">'.$user->first_name." ".$user->last_name.'  '.$star.'</span></a>
                                            
                                            <span>'.explode("T", $feed->createdAt)[0].'</span>

                                        </div>
                                        <div><h3>Subject: '.$feed->subject.'</h3></div>
                                        <div><h4>Content: </h4></div>
                                        <div class="chat-item-body">
                                            <p>'.$feed->content.'</p>
                                        </div>
                                    </div>
                                </div>';
                                echo $d;
                            }
                                ?>
                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>