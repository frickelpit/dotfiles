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

# source all the aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# my prompt
red='\[\e[0;31m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
blue='\[\e[0;34m\]'
magenta='\[\e[0;35m\]'
cyan='\[\e[0;36m\]'
default='\[\e[0;0m\]'
PS1="$magenta\h $default[$blue\w$default]\n\$$default " 
PROMPT_DIRTRIM=2

# Nice mount output
nmount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t; }
