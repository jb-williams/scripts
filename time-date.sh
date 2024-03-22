#!/bin/bash

dte="$(/usr/bin/date +"%a %b %e %r")"
# dte="$(/usr/bin/date +"%a, %B %d %l:%M%p"| /usr/bin/sed 's/  / /g')"
# /usr/bin/notify-send -t 3500 "$(/usr/bin/date '+%a %b %e %r')"
/usr/bin/echo "$dte"
/usr/bin/notify-send -t 3500 "$dte"
exit
