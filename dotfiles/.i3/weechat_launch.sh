#!/bin/bash

REMOTE=saturn

if [ -z "$REMOTE" ]
then
	[ -z "$(screen -ls | grep irc)" ] && screen -m -d -S irc weechat-curses

	$HOME/.i3/urxvt_launch.sh -e "screen -d -r irc"
else
	[ -z "$(ssh $REMOTE screen -ls | grep irc)" ] && ssh $REMOTE screen -m -d -S irc weechat-curses

	$HOME/.i3/urxvt_launch.sh -e "ssh $REMOTE -t screen -d -r irc"
fi
