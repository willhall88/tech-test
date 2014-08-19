<?php
  // ini_set('display_errors',1);  
  // error_reporting(E_ALL);

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
  $revenue = [];

  foreach ($table as $film_info){
    $subject = $film_info->textContent;
    $year_pattern = '/[1-2][0-9][0-9][0-9]/';
    $currency_pattern = '/[$]([0-9].+)/';

    if (preg_match($year_pattern, $subject)){
      array_push($year, $subject);
    }
    elseif (preg_match($currency_pattern, $subject)) {
      $money = str_replace(array('$', ','), '' , $subject);
      array_push($revenue, $money);
    }

  }

  $graph = new Graph(900,600);
  $graph->SetScale("linlin");

  $graph->img->SetMargin(100,100,100,100);    
  $graph->SetShadow();

  $graph->title->Set("Adjusted Gross Revenue vs Film Year");
  $graph->title->SetFont(FF_FONT1,FS_BOLD);

  $sp1 = new ScatterPlot($revenue,$year);

  $graph->Add($sp1);
  $graph->Stroke();
?>
    