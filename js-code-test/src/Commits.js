function ImageSizer(commits) {
	this.commitArray = commits;
};

ImageSizer.prototype.calculateSize = function(){
	var users = this.findCommitsByUser();
	
	users.forEach(function(user){
		user.avatar_size = user.commits * 10 + 40;
	});
	return users;
};

ImageSizer.prototype.findCommitsByUser = function() {
	var pulledData = this.pullData();

	pulledData.sort(sortById);
	this.addCommits(pulledData);
	
	var uniqueData = this.removeDuplicates(pulledData);
	return uniqueData;
};

ImageSizer.prototype.pullData = function() { 
	var pulledData =[];
	
	this.commitArray.forEach(function(commit){
		pulledData.push({id: commit.committer.id, avatar_url: commit.committer.avatar_url});
	});
	return pulledData;
};

ImageSizer.prototype.addCommits = function(array){
	var previousCommit = 0;
	var count = 1;

	array.forEach(function(commit){
		if (commit.id === previousCommit.id){
			count++;
			commit.commits = count;
		} else {
			commit.commits = 1;
			count = 1;
		}
		previousCommit = commit;
	});
}

ImageSizer.prototype.removeDuplicates = function(array){
	var uniqArray = [];
	
	while (array.length > 1) {
		if (array[0].id === array[1].id){
			array.shift();
		} else {
			uniqArray.push(array[0]);
			array.shift();
		}
	}
	if (array[0].id !== uniqArray.reverse()[0].id){
		uniqArray.push(array[0]);
	}

	return uniqArray;
}


function sortById(first, second){
	if (first.id > second.id){
		return 1;
	} 
	if (first.id < second.id) {
		return -1;
	}
	return 0;
}
