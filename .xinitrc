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

# Enable numlock on startup
numlockx &
# Disable touchpad
xinput disable 11

# Load .Xresources
xrdb ~/.Xresources

# Windowmanager
#exec openbox-session
exec i3
