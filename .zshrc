#!/usr/bin/env bash

export HOME_BIN=$HOME/bin
export PATH=$HOME_BIN:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
export ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm sudo zsh-autosuggestions zsh-syntax-highlighting)

# Prompt
#export PS1="$(context-color -p)$PS1\[\e[0m\]"
export PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"

# Networking
export NET_LOCAL="localhost"
export NET_SELF="$(hostname)"

# User configuration
# If command execution time above min. time, plugins will not output time.
export ZSH_COMMAND_TIME_MIN_SECONDS=3

# Set it to "" for disable echo `time: xx`.
export ZSH_COMMAND_TIME_ECHO=1

# Touchbar Iterm integration
export TOUCHBAR_GIT_ENABLED=true

export GIT_UNCOMMITTED="+"
export GIT_UNSTAGED="!"
export GIT_UNTRACKED="?"
export GIT_STASHED="$"
export GIT_UNPULLED="⇣"
export GIT_UNPUSHED="⇡"

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='micro'
else
  export EDITOR='micro'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# shellcheck source=/Users/rob/.iterm2_shell_integration.zsh
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# shellcheck source=/usr/local/etc/profile.d/autojump.sh
[ -f "/usr/local/etc/profile.d/autojump.sh" ] && source "/usr/local/etc/profile.d/autojump.sh"

# Lastpass CLI
export LPASS_AGENT_TIMEOUT=0

alias config='/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'

[[ -s "/usr/local/etc/grc.zsh" ]] && source "/usr/local/etc/grc.zsh"

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias sz="source ~/.zshrc"

alias zshrc="edit ~/.zshrc"
alias sshconfig="edit ~/.ssh/config"

historytop() {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head "-$1"
}

alias wh="command -v"
alias wha="which -a"

catw() {
  fpath=$(command -v "$1")
  echo "$fpath"
  echo
  cat "$fpath"
}

alias hg="history | grep -i"
alias eg="env | grep -i"
alias sshg="cat ~/.ssh/config | grep -i"
alias hostsg="cat /etc/hosts | grep -i"

alias tailf="tail -n 200 -f"

alias pkgi="pkg install"
alias pkgse="pkg search"
alias pkgif="pkg install -f"
alias pkgrm="pkg uninstall"
alias pkgup="pkg update && pkg upgrade"

alias bri="brew install"
alias brse="brew search"
alias brup="brew update && brew upgrade"
alias brrm="brew uninstall"

alias npmi="npm i"
alias npmig="npm i -g"
alias npmls="npm ls"
alias npmlsg="npm ls -g"
alias npmlsg0="npm ls -g --depth=0"
alias npmse="npm search"
alias npmrm="npm uninstall"
alias npmrmg="npm uninstall -g"
alias npmup="npm update"
alias npmupg="npm update -g"

alias apti="apt install"
alias aptse="apt search"
alias aptup="apt update && apt upgrade"
alias aptup2="apt update && apt full-upgrade"
alias aptrm="apt remove"
alias aptfix="apt-get update –fix-missing; dpkg –configure -a"

install-micro() {
  mkdir -p ~/bin
  cd ~/bin || echo "WARNING: unable to cd into ~/bin. Continuing anyway by installing 'micro' into current working directory..."
  curl https://getmic.ro | bash
}

install-omz-extras() {
  git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

init-ssh() {
  touch ~/.ssh/config
}

init-go() {
  mkdir -p ~/go
}