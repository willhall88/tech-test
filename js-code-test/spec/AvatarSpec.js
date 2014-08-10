describe("Github Commits", function() {
  var committer1 = {id: 1, avatar_url: "red-circle.jpg", other_info: "not needed"}
  var committer2 = {id: 2, avatar_url: "red-triangle.jpg", other_info: "not needed"}

  var commits = [
    {committer: committer1}, 
    {committer: committer2},
    {committer: committer1}
  ];

  var imageSizer;

  beforeEach(function() {
    imageSizer = new ImageSizer(commits);
  });
  
	it("should have the first avatar with size 60pixels", function() {
    users = imageSizer.calculateSize()
    addAvatar(users);
    expect($('<img id="'+users[0].id+'">')).toHaveCss({width: "60px"})
    // expect($('<img id="1" src="red-circle.jpg">')).toHaveCSS({height: "60px"})
  });

});



