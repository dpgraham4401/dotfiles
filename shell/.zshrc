# .zshrc
if [ "$TMUX" = "" ]; then tmux; fi
autoload -U colors && colors
fpath+=~/.zfunc
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch
unsetopt beep extendedglob notify
# Gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

bindkey '^H' backward-kill-word
bindkey -s '^F' 'nvim $(fzf)\n'

###--Prompt-###
autoload -Uz compinit
compinit
autoload -Uz vcs_info 
precmd () { vcs_info } 
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' [%F{1}%b%f]%u/%c'
zstyle ':vcs_info:*:*:dg' formats "%0.0r"

PS1='%F{5}%n@%F{14}%1~%f$vcs_info_msg_0_ %(?.%F{#00ff00}√.%F{#ff0000}✗%F{#ffffff}%?)%F{5}>%F{#ffffff}'

###--Oh My Zsh--###
export ZSH="$HOME/.oh-my-zsh"

# Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Plugins
plugins=(
	1password
	mvn
    golang 
	aws
    kubectl
	minikube
    docker
	npm
	nvm
    git
    web-search
    copybuffer
    dirhistory
    history
    pip
	helm
	rust
	gcloud
	terraform
)
source $ZSH/oh-my-zsh.sh
# if alias file exist
if [ -f "$HOME/.alias" ]; then
    source ~/.alias 
fi

eval "$(op completion zsh)"; compdef _op op
