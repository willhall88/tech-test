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

  it("create a new array with relevant data", function() {
    var committerData1 = {id: 1, avatar_url: "red-circle.jpg"}
    var committerData2 = {id: 2, avatar_url: "red-triangle.jpg"}
    var commitData = [committerData1, committerData2, committerData1]
    expect(imageSizer.pullData()).toEqual (commitData);
  });

  it("adds the commit count to each committer", function(){
    var committerData1 = {id: 1, avatar_url: "red-circle.jpg", commits: 2}
    var committerData2 = {id: 2, avatar_url: "red-triangle.jpg", commits: 1}
    var commitData = [committerData1, committerData2]
    expect(imageSizer.checkCommits()).toEqual (commitData);
  })

});


