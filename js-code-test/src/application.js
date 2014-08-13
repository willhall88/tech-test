$(document).ready(function() {
  addRepo("rails/rails");
  
  $(".search").on("submit", function(event) {
    var repoEntered;
    
    event.preventDefault();
    $("img").remove();
    repoEntered = $("#repo").val();
    addRepo(repoEntered);
  });
});

function addAvatar(users){
    users.forEach(function(user){
      var newAvatar;

      newAvatar = Mustache.render($('#avatar-template').html(), user);
      
      $(newAvatar).prependTo('#content');
      $("#"+user.id).css("width", user.avatarSize);
      $("#"+user.id).css("height", user.avatarSize);
    
    });
  };

function addRepo(repository) {
  $.get("https://api.github.com/repos/" + repository + "/commits", function(commits) {
    var firstTwentyCommits, imageSizer, users;
    
    firstTwentyCommits = commits.slice(0, 20);
    imageSizer = new ImageSizer(firstTwentyCommits);
    users = imageSizer.calculateSize();
    
    addAvatar(users);
  });
};

