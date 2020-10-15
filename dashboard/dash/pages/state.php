
<?php
include("../core/chart.php");

/* Agncyyyyyyyyyyyyy*/
if (($_SESSION["places"]==null) || ($_SESSION["users"]==null) || ($_SESSION["admins"]==null)|| ($_SESSION["agency"]==null)) {
    $agency = json_decode(post(URL_API,"admin/agency","","GET",$token));
    $users = json_decode(post(URL_API,"admin/users","","GET",$token));
    $admins= json_decode(post(URL_API,"admin/operations","","GET",$token));
    //$places= json_decode(post(URL_API,"admin/places","","GET",$token));
    $agency=$agency->data;
    $users=$users->data;
    $admins=$admins->data;
    $places=$places->place;
    $_SESSION["agency"]=$agency;
    $_SESSION["users"]=$users;
    $_SESSION["admins"]=$admins;
    $_SESSION["places"]=$places;
}else{
    
    $agency=$_SESSION["agency"];
    $users=$_SESSION["users"];
    $admins=$_SESSION["admins"];
    $admins=$_SESSION["places"];
}


$state_ag=array();
//$db=array();
$chart=array("caption"=> "Agency Prices Moyen",
    "yaxisname"=> "Moyen of prices",
    "aligncaptionwithcanvas"=> "0",
    
    "theme"=>"fusion");
foreach ($agency as $ag) {
	$price = explode("-", $ag->priceRange);
	$moy = ($price[0]+$price[1])/ 2;
	array_push($state_ag, array("label"=>$ag->name,"value"=>(string)$moy));
}

$db=array("data"=>$state_ag,"chart"=>$chart);


$show_agency = new FusionCharts("bar2d", "ex1", "100%", 400, "b2", "json", json_encode($db));
/*usersssss*/



$a=0;$b=0;$c=0;$d=0;
foreach ($users as $user) {

	$date=explode("-", $user->createdAt)[0];
	
  switch ($date) {
		case '2019':
		  $a++;
			break;
		case '2020':
      $b++;
      break;
    case '2021':
      $c++;
      break;
    case '2022':
      $d++;
      break;
   
	
	}
}

$e=0;$f=0;$g=0;$h=0;
foreach ($admins as $admin) {
  $date=explode("-", $admin->createdAt)[0];
  
  switch ($date) {
    case '2019':
      $e++;
      break;
    case '2020':
      $f++;
      break;
    case '2021':
      $g++;
      break;
    case '2022':
      $h++;
      break;
   
  
  }
}



$columnChart = new FusionCharts("mscolumn2d", "ex2", "100%", 400, "b1", "json", '{
  "chart": {
    "caption": "User statics for 4 last year",
    "subcaption": "2019-2022",
    "xaxisname": "Years",
    "yaxisname": "Number of Users",
    "formatnumberscale": "1",
    
    "theme": "fusion",
    "drawcrossline": "1"
  },
  "categories": [
    {
      "category": [
        {
          "label": "2019"
        },
        {
          "label": "2020"
        },
        {
          "label": "2021"
        },
        {
          "label": "2022"
        }
      ]
    }
  ],
  "dataset": [
    {
      "seriesname": "Hadj/Omra Users",
      "data": [
        {
          "value": "'.$a.'"
        },
        {
          "value": "'.$b.'"
        },
        {
          "value": "'.$c.'"
        },
        {
          "value": "'.$d.'"
        }
      ]
    },
    {
      "seriesname": "Administrators/Managers Users",
      "data": [
        {
          "value": "'.$e.'"
        },
        {
          "value": "'.$f.'"
        },
        {
          "value": "'.$g.'"
        },
        {
          "value": "'.$h.'"
        }
      ]
    },
    {
      "seriesname": "",
      "data": [
        {
          "value": ""
        },
        {
          "value": ""
        },
        {
          "value": ""
        },
        {
          "value": ""
        },
        {
          "value": ""
        }
      ]
    }
  ]
}');




/*
$hadj=0;
$omra=0;
foreach ($places as $place) {
  switch ($place->type) {
    case 'HADJ':
      $hadj++;
      break;
    case 'OMRA':
      $omra++;
      break;
    default:
      # code...
      break;
  }
}

$places_view = new FusionCharts("pie2d", "ex3", "100%", 400, "b3", "json", '{
  "chart": {
    "caption": "Tourist Places",
    "showlegend": "1",
    "showpercentvalues": "1",
    "legendposition": "bottom",
    "usedataplotcolorforlabels": "1",
    "theme": "fusion"
  },
  "data": [
    {
      "label": "Hadj",
      "value": "'.$hadj.'"
    },
    {
      "label": "Omra",
      "value": "'.$omra.'"
    }
  ]
}');

*/







echo '
<div class="row"> 
<div class="col-sm-6  ">
<div class="card">

';
$show_agency->render();
echo '
<div id="b2"></div></div></div>
';

echo '
<div class="col-sm-6  ">
<div class="card">

';

$columnChart->render();
echo '
<div id="b1"></div></div></div>';
/*
echo '
<div class="col-sm-6  ">
<div class="card">

';
$places_view->render();
echo '
<div id="b3"></div></div></div>';
*/
?>