# Path to your oh-my-zsh installation.
export ZSH=/Users/mcclowes/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME=bureau

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)





# User configuration

# Paths

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"





# Function to check for updates to the current directory if the CD is a git repo
cd () { builtin cd "$@" && cd_git_checker; }
cd_git_checker () { 
	if [ -d .git ]; then
		git fetch
	fi;
}








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

function codogo-react-scripts {
	dirName="${1:-new-project}"
	create-react-app --scripts-version codogo-react-scripts $dirName;
}

function gitJira {
	if [ $1 ]; then
		git commit -am "$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,' | sed -e 's/-/ /g' -e 's/ /-/' -e 's/ .\+//' ) $*";
	else 
		git commit -am "$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,' | sed -e 's/-/ /g' -e 's/ /-/')";
	fi
}

function rebaseBitBucketRepo {
	if [ -z ${var+x} ]; then 
		echo "No destination is set";
	else;
		git remote rename origin bitbucket;
		git remote add origin ${1};
		git push origin master;
		git remote rm bitbucket; 
	fi;
}

function customFunctions {
	echo "imgRemoveWhiteBackground < file type : png > < blur radius (tolerance) : 20 > - Bulk remove white background from all images in dir of specified format";
	echo "imgMaxSize < largest h or w in pixels : 1500 > - Bulk contain image sizes by each largest dimension";
	echo "imgConvertFormat < target format : png > <destination format : jpeg > - Bulk convert images from target format to destination format";
	echo "imgMaxSizeConvertTiny < largest h or w in pixels : 1500 > < target format : png > <destination format : jpeg > - All of the above combined";
	echo "codogo-react-scripts < project name : new-project > - create new react project using codogo create react app config";
	echo "gitJira <custom message> - make commit pertaining to jira issue";
	echo "moveRepoBBGH <destination> - rebase repo to new destination";
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh
