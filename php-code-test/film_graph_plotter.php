<?php
  DEFINE("TTF_DIR","/Library/Fonts/");
  DEFINE("TTF_FONTFILE","Verdana.ttf");

  require_once ('jpgraph/src/jpgraph.php');
  require_once ('jpgraph/src/jpgraph_scatter.php');
  require_once ('page_scraper.php');

  $graph = new Graph(900,600);
  $graph->SetScale('linlin',0.6,3,1976,2015); 
  $graph->img->SetMargin(100,100,100,100);
  $graph->yaxis->scale->ticks->Set(0.2);

  $graph->title->Set("Adjusted Gross Revenue vs Film Year");
  $graph->title->SetMargin(50,50,50,50);
  $graph->title->SetFont(FF_VERDANA, FS_NORMAL, 20);
  
  $graph->xaxis->SetTitle("Year", "center");
  $graph->xaxis->SetFont(FF_VERDANA, FS_NORMAL, 10);
  $graph->xaxis->title->SetFont(FF_VERDANA, FS_NORMAL, 15) ;
  $graph->xaxis->title->SetMargin(20) ;
  
  $graph->yaxis->SetTitle('Gross Revenue - $Billion', "center");
  $graph->yaxis->SetFont(FF_VERDANA, FS_NORMAL, 10);
  $graph->yaxis->title->SetFont(FF_VERDANA, FS_NORMAL, 15) ;
  $graph->yaxis->title->SetMargin(20) ;

  $scatterplot = new ScatterPlot($revenues,$year);
  $scatterplot->mark->SetType(MARK_FILLEDCIRCLE);
  $scatterplot->mark->SetWidth(4);
  $scatterplot->mark->SetColor("blue");

  $graph->Add($scatterplot);
  $graph->Stroke();

?>
    
    