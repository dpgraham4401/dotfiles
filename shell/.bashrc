# .bashrc
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
# if alias file exist
if [ -f "$HOME/.alias" ]; then source ~/.alias; fi
# if tmux, auto start
if [ "$TMUX" = "" ]; then tmux; fi

##### User specific aliases and functions
export PS1="\[\033[1;32m\]\u@\[\033[1;34m\]\W\[\033[1;34m\] \$\[\033[0m\] "
. "$HOME/.cargo/env"
export GPG_TTY=$(tty)

complete -C /usr/bin/terraform terraform
source <(kubectl completion bash)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dg/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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
# <<< conda initialize <<<

