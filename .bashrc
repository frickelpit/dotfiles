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

# making things easier
alias ls='ls --color=auto'
alias update='sudo pacman -Syu && pacaur -u'
alias sfetch='screenfetch -c 4 -s'
alias repkg='makepkg -efi --skipinteg'
alias dm='dosbox .dosbox/Doom/DOOMS/DOOM.EXE'
alias decrypt='encfs /home/pit/.secure /home/pit/Dokumente/Privat'
alias encrypt='fusermount -u /home/pit/Dokumente/Privat'

# my prompt
yellow='\[\e[0;33m\]\h'
blue='\[\e[0;34m\]\w \$'
default='\[\e[0;0m\]'
PS1="$yellow $blue $default" 

# Extract Files
extract() {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "\`$1': unrecognized file compression" ;;
      esac
  else
      echo "\`$1' is not a valid file"
  fi
}

# External IP
wmip() { printf "External IP: %s\n" $(curl -s  http://ifconfig.me/) ;}

# Nice mount output
nmount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t; }
