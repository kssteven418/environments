# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set personal colorscheme
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] (parse_git_branch)\[\033[00m\]\$'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\] \[\e[00;93m\]\$(parse_git_branch) \n\[\033[01;37m\]>>> \[\033[00m\]"

#export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
#export PS1="$HII\h $SI\w$GR\$(parse_git_branch)$NM] $IN"
# set a fancy prompt (non-color, unless we know we "want" color)
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# additionally set dictionary color as cyan
LS_COLORS=$LS_COLORS:'di=1;36'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias v='vi'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# virtualenv activateion
vsource() {
  if [ -z "$1" ] 
  then
    echo "Please type in the virtualenv name"
  else
    venv_path=/rscratch/sehoonkim/virtualenvs/$1/bin/activate
    if [ -f $venv_path ]; then
      source $venv_path
    else
      echo "Virtualenv $1 does not exist!"
    fi
  fi
}



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# local PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
#export PATH=$PATH:$WORKHOME/local/python/bin
export PATH=$PATH:$HOME/local/python/bin
#export PATH=$HOME/local/python/bin
export LD_LIBRARY_PATH=/lib/x86_64-linux-gnu:/lib

# for LLVM use
export PATH=$PATH:$WORKHOME/local/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-16.04/bin

# custom keywords
alias tt='tmux_attach'
alias tkill='tmux kill-session -t workspace'
alias cdd='cd $WORKHOME'

# fix the locale problem
export LC_ALL="en_US.UTF-8"

# Set PATH here
#export CUDA_HOME=/home/steven/local/cuda
#export PATH=$PATH:/home/steven/torch/install/bin:/home/steven/torch/install/bin:/home/steven/SPL/scripts:/home/steven/anaconda3/bin:/opt/Xilinx/DocNav:/opt/Xilinx/Vivado/2016.4/bin:/opt/Xilinx/Vivado_HLS/2016.4/bin:/home/steven/torch/install/bin:/home/steven/torch/install/bin:/home/steven/bin:/home/steven/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/steven/local/python/bin
#export PATH=${CUDA_HOME}/bin:${PATH}
#export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

#export PYTHONPATH=/home/steven/workspace/janus-v2:/home/steven/workspace/janus-v2/experiments/models/RL:/home/steven/workspace/janus-v2/experiments/models/GNN/tf2-gnn

# For CUDA use
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

export PATH=${CUDA_HOME}/bin:${PATH} 

# For TVM use
export TVM_HOME=$WORKHOME/tvm # default TVM
#export TVM_HOME=$WORKHOME/tvm_zachzzc # zach's INT4 TVM
export PYTHONPATH=$TVM_HOME/python:$TVM_HOME/topi/python:${PYTHONPATH}
