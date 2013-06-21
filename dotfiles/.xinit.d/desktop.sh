echo desktop.sh

xrdb ~/.Xresources
compton --vsync opengl -f -m 0.85 &
eval `cat ~/.fehbg`
xsetroot -cursor_name left_ptr &
xautolock -locker "i3lock -n -c 000000" -time 5 &
pamusb-agent &
twmnd &
