# Path to your oh-my-zsh installation.
export ZSH=/Users/mcclowes/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=bureau

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Path to your oh-my-zsh installation.
export ZSH=/Users/mcclowes/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=bureau

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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








# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH"

# Function to check for updates to the current directory if the CD is a git repo
cd () { builtin cd "$@" && cd_git_checker; }
cd_git_checker () { 
	if [ -d .git ]; then
		git fetch
	fi;
}

export PATH="$HOME/.yarn/bin:$PATH"


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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH"

# Function to check for updates to the current directory if the CD is a git repo
cd () { builtin cd "$@" && cd_git_checker; }
cd_git_checker () { 
	if [ -d .git ]; then
		git fetch
	fi;
}

export PATH="$HOME/.yarn/bin:$PATH"


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

function codogo-react-scripts {
	dirName="${1:-new-project}"
	create-react-app --scripts-version codogo-react-scripts $dirName;
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh