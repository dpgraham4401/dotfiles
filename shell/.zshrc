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

# Created by `pyprojectx` on 2024-09-27 19:26:39
export PATH="$PATH:/Users/dg/.pyprojectx"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dg/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dg/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/dg/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dg/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/dg/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/dg/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
