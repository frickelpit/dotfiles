#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# merge .Xresources
userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
   xrdb -merge "$userresources"
fi
# set DPI
xrandr --dpi 125
# start some usefull things
urxvtd -q -o -f &
xbindkeys &
unclutter -noevents -idle 5 &
dunst &
# set the Wallpaper
sh $HOME/.fehbg &
# start the WM
bash $HOME/.bin/dwmbar &
exec $HOME/.bin/startdwm
