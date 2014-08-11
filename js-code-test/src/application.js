
$(document).ready(function() {
  $.get('https://api.github.com/repos/rails/rails/commits', function(commits){
		firstTwentyCommits = commits.slice(0,20);
		var imageSizer = new ImageSizer(firstTwentyCommits);

		var users = imageSizer.calculateSize();
		addAvatar(users);
		
	});

	function addAvatar(users){
		users.forEach(function(user){
				var newAvatar = Mustache.render($('#avatar-template').html(), user);
				$(newAvatar).prependTo('#content');
				$("#"+user.id).css("width", user.avatar_size);
				$("#"+user.id).css("height", user.avatar_size);
		});
	};
});