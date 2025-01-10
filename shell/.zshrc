# .zshrc
autoload -U colors && colors
alias zshrc="source ~/.zshrc"
fpath+=~/.zfunc
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch
unsetopt beep extendedglob notify

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
export ZSH="/home/dg/.oh-my-zsh"

# Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(
    golang 
    dnf
    kubectl
    minikube
    docker
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
    1password
    conda
    conda-env
)
source $ZSH/oh-my-zsh.sh
source ~/.alias
export GPG_TTY=$(tty)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Created by `pyprojectx` on 2024-09-24 21:29:24
export PATH="$PATH:/home/dg/.pyprojectx"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dg/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dg/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/dg/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dg/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/dg/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/dg/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

