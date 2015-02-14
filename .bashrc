#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update='sudo pacman -Syu && pacaur -u'
alias sfetch='screenfetch -c 4 -s'
alias cubeback='sudo mount -t nfs 192.168.2.106:/volume1/Backup /mnt/backup'
alias repkg='makepkg -efi --skipinteg'

PS1="\[\e[0;0m\]┌─[\e[0;33m\]\u\[\e[0;0m\]][\[\e[0;34m\]\h\[\e[0;0m\]][\[\e[0;0m\]\w\[\e[0;0m\]]\n\[\e[0;0m\]└──╼ "

source /usr/share/doc/pkgfile/command-not-found.bash
