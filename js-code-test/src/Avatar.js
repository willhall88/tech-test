function addAvatar(users){
	users.forEach(function(user){
			var newAvatar = Mustache.render($('#avatar-template').html(), user);
			$(newAvatar).prependTo('#content')
			$("#"+user.id).css("width", user.avatar_size)
			$("#"+user.id).css("height", user.avatar_size)
	});
};