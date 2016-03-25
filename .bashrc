#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add .bin to PATH
export PATH="${PATH}:/home/pit/.bin"

# history settings
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export HISTIGNORE="sudo*"

# source all the aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# my prompt
magenta='\[\e[0;35m\]\h'
blue='\[\e[0;34m\]\w\$'
default='\[\e[0;37m\]'
PS1="$magenta $blue$default " 

# Nice mount output
nmount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t; }
