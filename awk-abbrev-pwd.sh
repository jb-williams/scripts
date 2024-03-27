#!/bin/sh

# this just shortens the path to the pwd so it takes up less space
# i use in my bash prompt and my tmux status bar
working_dir="$(pwd | awk -F'/' '{if (NF >=4 && $2=="home" && $(NF-1)==ENVIRON["USER"]) {print "~/"$NF} else if (NF >=4 && $2=="home" && $3==ENVIRON["USER"]) {print "~/../"$(NF-1)"/"$NF} else if (NF<=4 && $3==ENVIRON["USER"]) {print "~/"} else {print $0}}')"
printf "%s" "{$working_dir}" || printf "Error awk-abbrev-pwd.sh"; exit 1
exit 0
