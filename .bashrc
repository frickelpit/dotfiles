#
# "$HOME"/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add .bin to PATH
export PATH="${PATH}:$HOME/.bin"

# history settings
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth

# source all the aliases
if [ -f "$HOME"/.bash_aliases ]; then
    . "$HOME"/.bash_aliases
fi

# setting correct term
if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi

# source git prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    . /usr/share/git/completion/git-prompt.sh
fi

# my prompt
red='\[\e[0;31m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
blue='\[\e[0;34m\]'
magenta='\[\e[0;35m\]'
cyan='\[\e[0;36m\]'
default='\[\e[0;0m\]'
PS1='\[\e[0;34m\]\h \[\e[0;0m\][\[\e[0;31m\]\w$(__git_ps1 " \[\e[0;32m\]%s")\[\e[0;0m\]]\n\$ '
PROMPT_DIRTRIM=2

# functions
nmount() {
(echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t;
}

gitup() {
case "$1" in
   uu)
	git -C "$HOME"/admin/ubuntuusers/ansible checkout master
	git -C "$HOME"/admin/ubuntuusers/ansible remote update
	git -C "$HOME"/admin/ubuntuusers/ansible rebase origin/master
	git -C "$HOME"/admin/ubuntuusers/ubuntu-ca checkout master
	git -C "$HOME"/admin/ubuntuusers/ubuntu-ca remote update
	git -C "$HOME"/admin/ubuntuusers/ubuntu-ca rebase origin/master
	git -C "$HOME"/admin/ubuntuusers/keepass checkout master
	git -C "$HOME"/admin/ubuntuusers/keepass remote update
	git -C "$HOME"/admin/ubuntuusers/keepass rebase origin/master
	;;
   *)
	printf "No such repository\n"
	;;
esac
}
