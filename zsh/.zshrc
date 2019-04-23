# Paste beneath existing config

# Function to check for updates to the current directory if the CD is a git repo
cd () { builtin cd "$@" && cd_git_checker; }
cd_git_checker () { 
	if [ -d .git ]; then
		git fetch
	fi;
}

# Brew automcomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

## --------------- Custom Functions --------------- 

function editZSH {
	sublime ~/.zshrc;
}

## Codogo sites
function updateCodogoMarketingSites {
	for FOLDER in codogo-site-write codogo-site-marketing codogo-site-projects codogo-site-consulting ; do
		pushd $FOLDER
			git add --all;
			git commit -am “$1”;
			git push;
		popd
	done
}

function upgradeCodogoMarketingSites {
	for FOLDER in codogo-site-write codogo-site-marketing codogo-site-projects codogo-site-consulting ; do
		pushd $FOLDER
			yarn upgrade codogo-marketing-scss;
		popd
	done
}

## image manipulation
function imgRemoveWhiteBackground {
	fileType="${1:-png}"
	blurRad="${2:-20}"
	find . -type f -name *.$fileType -print0 | while IFS= read -r -d $'\0' file; do 
		convert -verbose $file -fuzz $blurRad% -transparent white "$file"; 
	done
}

function imgMaxSize {
	maxSize="${1:-1500}"
	fileType="${2:-png}"
	for file in *.$fileType ; do 
		convert -verbose $file -thumbnail "$maxSizex$maxSize" ./$file ; 
	done
}

function imgConvertFormat {
	fromFileType="${1:-png}"
	toFileType="${2:-jpg}"
	for file in *.$fromFileType ; do 
		convert -verbose $file "$( echo "./$file.$toFileType" | sed -e "s/\.$fromFileType//" )" ; 
	done
}

function imgMaxSizeConvertTiny {
	maxSize="${1:-1500}"
	fromFileType="${2:-png}"
	toFileType="${3:-jpg}"
	imgMaxSize $maxSize $fromFileType;
	imgConvertFormat $fromFileType $toFileType;
	tinypng;
}

## Create react app with custom scripts
function mcclowes-react-scripts {
	dirName="${1:-new-project}"
	create-react-app --scripts-version mcclowes-react-scripts $dirName;
}

function rebaseBitBucketRepo {
	if [ ${var+x} ]; then 
		echo "No destination is set";
	else;
		git remote rename origin bitbucket;
		git remote add origin ${1};
		git push origin master;
		git remote rm bitbucket; 
	fi;
}

function customFunctions {
	echo "editZSH - Edit this file";
	echo "imgRemoveWhiteBackground < file type : png > < blur radius (tolerance) : 20 > - Bulk remove white background from all images in dir of specified format";
	echo "imgMaxSize < largest h or w in pixels : 1500 > - Bulk contain image sizes by each largest dimension";
	echo "imgConvertFormat < target format : png > <destination format : jpeg > - Bulk convert images from target format to destination format";
	echo "imgMaxSizeConvertTiny < largest h or w in pixels : 1500 > < target format : png > <destination format : jpeg > - All of the above combined";
	echo "mcclowes-react-scripts < project name : new-project > - create new react project using mcclowes-scripts create react app config";
	echo "rebaseBitBucketRepo <destination> - rebase repo to new destination (with .git at the end)";
	echo "workFunctions - echo a list of custom functions for work";
}




## --------------- 

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh



## --------------- Work Functions ---------------

## Utility function for other functions
function gitCurrentBranch {
	git symbolic-ref -q --short HEAD
}

alias gpr='gco master; git pull; gco -; git rebase master; git push --force-with-lease'

function gcojira {
	echo "WEB code:";
	read CODE;
	echo "Task:";
	read TASK;
	TR_TASK="$( echo "$TASK" | tr "[:upper:]" "[:lower:]" | tr ' ' '-' )";
	BRANCH_NAME="WEB-$CODE-$TR_TASK"
	git checkout master && git pull && git checkout -b "$BRANCH_NAME" && git push -u origin "$BRANCH_NAME"
}

function grename {
	git rebase -i $( git merge-base $( gitCurrentBranch ) master )
}

## Jest functions
function jw { # jest watch
	## -- means pass params to jest
	npm test -- --watch --runInBand --bail ${1}
}

function jwnc { # jest watch no cache
	## -- means pass params to jest
	npm test -- --watch --no-cache --runInBand --bail ${1}
}

function jwa { # jest watch all
	## -- means pass params to jest
	npm test -- --watchAll --runInBand --bail ${1}
}

function workFunctions {
	echo "gpr - git rebase on master";
	echo "grename - trigger rebase, allowing you to rename all commit since master";
	echo "gcojira - Checkout a branch in the format required to correspond to a Jira issue";
	echo "jw <regex pattern for files> - Run tests, watch and bail";
	echo "jwnc <regex pattern for files> - Run tests, watch and bail";
	echo "jwa <regex pattern for files> - Run all tests, watch and bail";
}
