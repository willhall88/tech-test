function ImageSizer(commits) {
	this.commitArray = commits
}


ImageSizer.prototype.pullData = function() { 
	newArray =[];
	this.commitArray.forEach(function(commit){
		newArray.push({id: commit.committer.id, avatar_url: commit.committer.avatar_url});
	});
	return newArray;
};

ImageSizer.prototype.checkCommits = function() {
	newArray = this.pullData();
	newArray.sort(sortById);
	this.addCommits(newArray);
	this.removeDuplicates(newArray);
	return newArray;
};


ImageSizer.prototype.removeDuplicates = function(array){
	var previousCommit = 0
	array.reverse().forEach(function(commit){
		if (commit.id == previousCommit.id){
			i = array.indexOf(commit);
			array.splice(i, 1);
		}
		previousCommit = commit;
	});
	array.reverse();
}

ImageSizer.prototype.addCommits = function(array){
	var previousCommit = 0;
	var count = 1;
	newArray.forEach(function(commit){
		if (commit.id === previousCommit.id){
			count++;
			commit.commits = count;
		} else {
			commit.commits = 1;
			count = 1
		}
		previousCommit = commit;
	});
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
