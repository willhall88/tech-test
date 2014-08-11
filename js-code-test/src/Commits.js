function ImageSizer(commitCount) {
	this.commits = commitCount;
};

ImageSizer.prototype.calculateSize = function(){
	var users = this.findCommitsByUser();
	
	users.forEach(function(user){
		user.avatarSize = user.commits * 10 + 40;
	});
	return users;
};

ImageSizer.prototype.findCommitsByUser = function() {
	var pulledData = this.pullData();

	pulledData.sort(this.sortById);
	var uniqueData = this.addCommits(pulledData);
	
	return uniqueData;
};

ImageSizer.prototype.pullData = function() { 
	var pulledData =[];
	
	this.commits.forEach(function(commit){
		pulledData.push({id: commit.committer.id, avatarUrl: commit.committer.avatar_url});
	});
	return pulledData;
};

ImageSizer.prototype.addCommits = function(array){
	var uniqArray = [];
	var previousCommit = 0;
	var count = 1;

	array.forEach(function(commit){
		if (commit.id === previousCommit.id){
			count++;
			commit.commits = count;
		} else {
			uniqArray.push(previousCommit)
			commit.commits = 1;
			count = 1;
		}
		previousCommit = commit;
	});
	uniqArray.push(previousCommit);
	uniqArray.splice(0,1);

	return uniqArray;
}



ImageSizer.prototype.sortById = function(first, second){
	if (first.id > second.id){
		return 1;
	} 
	if (first.id < second.id) {
		return -1;
	}
	return 0;
}
