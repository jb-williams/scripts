#!/bin/sh

#clear
printf "Mem: \n%s\n\nDisk: \n%s\n\nUptime: \n%s\n" "$(/usr/bin/free -h)", "$(/usr/bin/df -h /dev/* | /usr/bin/grep -iE 'nvme|mapper|sd*' |/usr/bin/grep -vE 'pts|fs' 2>/dev/null)", "$(/usr/bin/uptime)"
#printf "Mem: \n%s\n\nDisk: \n%s\n\nUptime: \n%s\n" "$(/usr/bin/free -h)", "$(/usr/bin/df -h /dev/* | /usr/bin/grep -iE 'nvme|mapper|sd*' |/usr/bin/grep -vE 'pts|fs' 2>/dev/null)", "$(/usr/bin/uptime)" | fzf --prompt="Search for Program to Run : " --border=rounded --margin=5% --color=dark --height 100% --reverse --header="                    PROGRAMS " --info=hidden --header-first 
