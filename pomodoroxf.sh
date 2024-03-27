#!/bin/sh
# basic Pomodoro clock
# set -eou pipefail
work_time="2700" #45min
break_time="900" #15min
# work_time="2400" #40min
# break_time="900" #15min

notify-send -t 1500 "Starting Pomodoroxf"
# 60min
sleep "${work_time}" && notify-send -t 3000 "break" && /usr/bin/play -r 5 /usr/share/sounds/freedesktop/stereo/bell.oga

sleep "${break_time}" && notify-send -t 3000 "back to study" && /usr/bin/play -r 5 /usr/share/sounds/freedesktop/stereo/bell.oga
# +60min
sleep "${work_time}" && notify-send -t 3000 "break" && /usr/bin/play -r 5 /usr/share/sounds/freedesktop/stereo/bell.oga
sleep "${break_time}" && notify-send -t 3000 "END STUFF FOR A TIME" && /usr/bin/play -r 5 /usr/share/sounds/freedesktop/stereo/bell.oga
# sleep "$break_time" && notify-send -t 4000 "back to study" && /usr/bin/play -r 5 /usr/share/sounds/freedesktop/stereo/bell.oga
# sleep "$work_time" && notify-send -t 4000 "END STUDY FOR A TIME" && /usr/bin/play -r 5 /usr/share/sounds/freedesktop/stereo/bell.oga
