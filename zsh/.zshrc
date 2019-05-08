# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/max.clayton/development/mcclowes/oh-my-zsh"

# Set list of themes to load
ZSH_THEME="bureau"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  codogo
  experiments
  git
  githubutils
  imagetools
  mcclowes
  pluginlist
  workshare
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/node@10/bin:$PATH"

## --------------- User configuration --------------- 

# Paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/sbin:$PATH"

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

## --------------- 

# tabtab source for serverless package # uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/serverless.zsh

# tabtab source for sls package # uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mcclowes/Development/vocalise-app/node_modules/tabtab/.completions/sls.zsh