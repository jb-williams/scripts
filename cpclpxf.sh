#!/bin/sh
# set -eo pipefail
normal="\e[0m"
bold="\e[1m"
green="\e[32m"
orange="\e[33m"
if ! command -v /bin/fzf &>/dev/null; then
	printf "REQUIRES PROGRAM FZF!" && exit 2
fi
if [ ! -d "${TEMPDIR}" ] || [ -z "${TEMPDIR}" ]; then
	mktemp -d --suffix="-$(date '+%m-%d-%Y')" &>/dev/null
	TEMPDIR="$(/bin/ls -ltdr ${TEMP}/tmp.* 2>/dev/null | head -1 | awk '{print $NF}' 2>/dev/null)"
else
	exit 1
fi

CLIPFILE="${TEMPDIR}/tmpclp-$(date '+%m-%d-%Y').txt"

# if clipfile exists copy clipboard into clipfile
if [ -f "$CLIPFILE" ]; then
    /usr/bin/echo -e "$(/usr/bin/xclip -sel c -o)" >> "$CLIPFILE"

# if clipfile exists, create it, then copy clipboard into clipfile
else
    /usr/bin/touch "$CLIPFILE" \
		&& /usr/bin/chmod 600 "$CLIPFILE" \
		&& /usr/bin/echo -e "$(/usr/bin/xclip -sel c -o)" >> "$CLIPFILE"
# 		&& /usr/bin/echo -e "$(/usr/bin/xclip -sel c -o)" >> "$CLIPFILE" \
# 		&& printf "${green}No ${bold}${orange}Clipman${normal}${green}, empty ${bold}%s${normal}${green} created!" "$CLIPFILE"
fi
exit 0

