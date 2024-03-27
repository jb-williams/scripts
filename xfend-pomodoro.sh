#!/bin/sh
if_running="$(ps -aux | grep pomodoroxf.sh | grep -vE 'vim|grep' | awk '{print $2}' | head -1)"
if [ -n "${if_running}" ]; then
	notify-send -t 1000 "pomodoro running ... killing ..."
	kill "${if_running}" || exit 2
fi
exit 0
