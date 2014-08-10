
$(document).ready(function() {
  $.get('https://api.github.com/repos/rails/rails/commits', function(commits){
		firstTwentyCommits = commits.slice(0,20);
		imageSizer = new ImageSizer(firstTwentyCommits);

		users = imageSizer.calculateSize();
		addAvatar(users);
		
	});
});