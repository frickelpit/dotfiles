#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update='sudo pacman -Syu && pacaur -u'
alias sfetch='screenfetch -c 4 -s'
alias cubeback='sudo mount -t nfs 192.168.2.106:/volume1/Backup /mnt/backup'
alias cubeplay='sudo mount -t nfs 192.168.2.106:/volume1/Musik /mnt/musik'
alias repkg='makepkg -efi --skipinteg'
alias dm='dosbox .dosbox/Doom/DOOMS/DOOM.EXE'

PS1='\[\e[0;33m\]\$\[\e[m\] \[\e[0;34m\]\w\[\e[m\]\[\e[0;0m\] '

source /usr/share/doc/pkgfile/command-not-found.bash
