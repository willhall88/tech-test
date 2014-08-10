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
    var Data1 = {id: 1, avatar_url: "red-circle.jpg"}
    var Data2 = {id: 2, avatar_url: "red-triangle.jpg"}
    var commitData = [Data1, Data2, Data1]
    expect(imageSizer.pullData()).toEqual (commitData);
  });

  it("adds the commit count to each committer", function(){
    var Data1 = {id: 1, avatar_url: "red-circle.jpg", commits: 2}
    var Data2 = {id: 2, avatar_url: "red-triangle.jpg", commits: 1}
    var commitData = [Data1, Data2]
    expect(imageSizer.findCommitsByUser()).toEqual (commitData);
  });

  it("can calculate the avatar size", function(){
    var Data1 = {id: 1, avatar_url: "red-circle.jpg", commits: 2, avatar_size: 60}
    var Data2 = {id: 2, avatar_url: "red-triangle.jpg", commits: 1, avatar_size: 50}
    var commitData = [Data1, Data2]
    expect(imageSizer.calculateSize()).toEqual (commitData);
  });

});


