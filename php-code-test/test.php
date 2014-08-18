<?php
  $curl_handler = curl_init("http://en.wikipedia.org/wiki/List_of_highest-grossing_films");
  curl_setopt($curl_handler, CURLOPT_RETURNTRANSFER, true);
  $cl = curl_exec($curl_handler);

  $dom = new DOMDocument();
  $dom->loadHTML($cl);
  
  $xpath = new DOMXpath($dom);
  
  $my_xpath_query = "//*[@id='mw-content-text']/table[1]//td";
  $table = $xpath->query($my_xpath_query);
  $new_table = [];

  foreach ($table as $film_info){
    array_push($new_table, $film_info->textContent);
  }

  array_splice($new_table, 0, 1);
  while(count($new_table)){
    $matchup = array_splice($new_table, 0, 2);
    $rows .= '<tr><td>'.implode('</td><td>', $matchup).'</td></tr>';
    array_splice($new_table, 0, 2);
  }

  echo "<table>$rows</table>";
?>
    