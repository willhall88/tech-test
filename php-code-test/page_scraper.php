<?php
	  $curl_handler = curl_init("http://en.wikipedia.org/wiki/List_of_highest-grossing_films");
	  curl_setopt($curl_handler, CURLOPT_RETURNTRANSFER, true);
	  $cl = curl_exec($curl_handler);

	  $dom = new DOMDocument();
	  $dom->loadHTML($cl);
	  $xpath = new DOMXpath($dom);
	  
	  $table = $xpath->query("//*[@id='mw-content-text']/table[1]//td");
	  $year = [];
	  $revenues = [];

	  foreach ($table as $film_info){
	    $cell_data = $film_info->textContent;

	    if (year_check($cell_data)){
	      array_push($year, $cell_data);
	    }
	    elseif (currency_check($cell_data)) {
	    	$revenue = currency_to_graph_format($cell_data);
	      array_push($revenues, $revenue);
	    }
	  }
	  
	  function currency_to_graph_format($currency) {
	    $remove_characters = str_replace(array('$', ','), '' , $currency);
	    return $format_length = ($remove_characters/1000000000);
	  }

	  function year_check($data){
	    $year_pattern = '/[1-2][0-9][0-9][0-9]/';
	  	return preg_match($year_pattern, $data);
	  }

	  function currency_check($data){
	    $currency_pattern = '/[$]([0-9].+)/';
	  	return preg_match($currency_pattern, $data);
	  }
?>