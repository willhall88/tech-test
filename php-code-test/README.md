# PHP Technical Test

**UPDATE** I have done this test again using TDD. You can find this verion [here].
[here]:https://github.com/willhall88/php-tech-test

As I started this project very new to PHP (it being my very first piece of PHP code) I started off just using some trial and error to see what I could get to appear on the screen and understanding the syntax and methods. The task kind of grew from there. I will look into starting this task from scratch with documented tests as the next step.

I encountered a few problems to begin with in this task whilst trying to set up my local environment, however I managed to overcome most of these with more research and some trial and error.
I used MAMP to run a local server to check my output. I decided to use this as it was quite straight forward to setup and use, meaning I could focus more on the task rather than setting up and running a server (I originally attempted to use Nginx, but had problems which were taking too long to solve. I will look back into this at a later stage).

In its current state I have managed to write some code which scrapes the relevant data and puts the revenue and year into seperate arrays. These arrays are then used to create a graph using JpGraph. I have seperated the scripts into a clearer file structure. These should really be classes.



The task
--------

Your task for this test is below. Use PHP throughout and whatever libraries you deem appropriate. Please do all visualisation heavy lifting in PHP, so no use of Javascript for graphing for example, though do feel free to use CSS in your final output.

Write a PHP application to function as a standalone webpage, e.g. `http://localhost/test.php`, accessible from a web browser where accessing the page performs both of the following actions. 

It should work in a normal Apache/Nginx PHP environment using PHP 5.3 or 5.4

1. Scrape the table on this page for the top 100 grossing films: http://en.wikipedia.org/wiki/List_of_highest-grossing_films. The script should download the page and extract the relevant data.  
2. Using a graphing library (e.g. GraPHPite, pChart or JpGraph etc.), create a scatter plot of the data showing **Adjusted Gross Revenue vs Film Year**.  
