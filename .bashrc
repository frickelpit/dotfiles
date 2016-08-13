#
# "$HOME"/.bashrc
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
if [ -f "$HOME"/.bash_aliases ]; then
    . "$HOME"/.bash_aliases
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

# functions
nmount() { 
(echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2=$4="";1') | column -t;
}

keygrep() {
if [[ -f "$HOME"/dokumente/priv/keys.txt ]]; then
   grep "$1" "$HOME"/dokumente/priv/keys.txt
else
   printf "No such file or directory\n"
fi
}

gitup() {
case "$1" in
   uu)
	git -C "$HOME"/admin/ubuntuusers/ansible checkout master
	git -C "$HOME"/admin/ubuntuusers/ansible pull
	git -C "$HOME"/admin/ubuntuusers/ubuntu-ca checkout master
	git -C "$HOME"/admin/ubuntuusers/ubuntu-ca pull
	;;
   dwm)
	git -C "$HOME"/projekte/git/dwm checkout master
	git -C "$HOME"/projekte/git/dwm pull
	;;
   bar)
	git -C "$HOME"/projekte/git/slstatus checkout master
	git -C "$HOME"/projekte/git/slstatus pull
	;;
   st)
	git -C "$HOME"/projekte/git/st pull
	;;
   bgs)
	git -C "$HOME"/projekte/git/bgs checkout master
	git -C "$HOME"/projekte/git/bgs pull
	;;
   *)
	printf "No such repository\n"
	;;
esac
}
