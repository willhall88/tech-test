# PHP Technical Test

I encountered a number of problems when trying to set up my local environment to carry this task out. I ended up using MAMP to run a local server in order for me to check my output, however I am still not receiving any error messages which is making debugging hard, especially as I am knew to using php.
In its current state I have run some basic code to extract the relevant table data from the website, with the aim at now looking into using a graphing library to output the data. 

Your task for this test is below. Use PHP throughout and whatever libraries you deem appropriate. Please do all visualisation heavy lifting in PHP, so no use of Javascript for graphing for example, though do feel free to use CSS in your final output.

Write a PHP application to function as a standalone webpage, e.g. `http://localhost/test.php`, accessible from a web browser where accessing the page performs both of the following actions. 

It should work in a normal Apache/Nginx PHP environment using PHP 5.3 or 5.4

1. Scrape the table on this page for the top 100 grossing films: http://en.wikipedia.org/wiki/List_of_highest-grossing_films. The script should download the page and extract the relevant data.  
2. Using a graphing library (e.g. GraPHPite, pChart or JpGraph etc.), create a scatter plot of the data showing **Adjusted Gross Revenue vs Film Year**.  