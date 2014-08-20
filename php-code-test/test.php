<?php
  // ini_set('display_errors',1);
  // error_reporting(E_ALL);
  // Change this defines to where Your fonts are stored
  DEFINE("TTF_DIR","/Library/Fonts/");
   
  // Change this define to a font file that You know that You have
  DEFINE("TTF_FONTFILE","arial.ttf");

  require_once ('jpgraph/src/jpgraph.php');
  require_once ('jpgraph/src/jpgraph_scatter.php');
  $curl_handler = curl_init("http://en.wikipedia.org/wiki/List_of_highest-grossing_films");
  curl_setopt($curl_handler, CURLOPT_RETURNTRANSFER, true);
  $cl = curl_exec($curl_handler);

  $dom = new DOMDocument();
  $dom->loadHTML($cl);
  
  $xpath = new DOMXpath($dom);
  
  $my_xpath_query = "//*[@id='mw-content-text']/table[1]//td";
  $table = $xpath->query($my_xpath_query);
  $year = [];
  $revenues = [];

  foreach ($table as $film_info){
    $subject = $film_info->textContent;
    $year_pattern = '/[1-2][0-9][0-9][0-9]/';
    $currency_pattern = '/[$]([0-9].+)/';

    if (preg_match($year_pattern, $subject)){
      array_push($year, $subject);
    }
    elseif (preg_match($currency_pattern, $subject)) {
      $revenue = str_replace(array('$', ','), '' , $subject);
      $revenue = ($revenue/1000000000);
      array_push($revenues, $revenue);
    }

  }

  $graph = new Graph(900,600);
  $graph->SetScale('linlin',0.4,3,1976,2015); 
  $graph->yaxis->scale->ticks->Set(0.2);

  $graph->img->SetMargin(100,100,100,100);

  $graph->ygrid->SetFill(true,'#EFEFEF','#BBCCFF'); 
  $graph->xgrid->SetColor('#DDDDDD');
  $graph->xgrid->Show();

  $graph->title->Set("Adjusted Gross Revenue vs Film Year");
  $graph->xaxis->SetTitle("Year", "center");
  $graph->yaxis->SetTitle('Gross Revenue - $Billion', "center");
  $graph->xaxis->SetFont(FF_ARIAL, FS_NORMAL, 10);
  $graph->yaxis->SetFont(FF_ARIAL, FS_NORMAL, 10);
  $graph->title->SetFont(FF_ARIAL, FS_NORMAL, 18);

  $sp1 = new ScatterPlot($revenues,$year);

  $sp1->mark->SetType(MARK_FILLEDCIRCLE);
  $sp1->mark->SetWidth(4);
  $sp1->mark->SetColor("blue");

  $graph->Add($sp1);
  $graph->Stroke();
?>
    
    
