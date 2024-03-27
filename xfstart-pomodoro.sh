#!/bin/sh
if_running="$(ps -aux | grep pomodoroxf.sh | grep -vE 'vim|grep' | awk '{print $2}' | head -1)"
if [ -n "${if_running}" ]; then
	notify-send -t 1000 "pomodoro already running ... killing and restarting..."
	kill "${if_running}" || exit 2
fi
#bash ~/scripts/pomodoroxf.sh &
"${SCRIPTSDIR}"/pomodoroxf.sh &
exit 0

