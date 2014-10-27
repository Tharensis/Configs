#
# ~/.bash_profile
#

amixer set Master 0 > /dev/null

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
