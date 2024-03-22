#!/bin/sh
#set -eou pipefail
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

# check if file exists
if [ ! -f "${CLIPFILE}" ]; then
	printf "${green}No ${bold}${orange}Clipman${normal}${green}, ${bold}%s${normal}${green} not created yet!\n" "$CLIPFILE"

# if file exists, check if it is empty
elif [ -f "${CLIPFILE}" ] && [ -z "$(cat "$CLIPFILE")" ]; then
	printf "${green}Empty ${bold}${orange}Clipman${normal}${green}, ${bold}%s${normal}${green} created but empty!\n" "$CLIPFILE"

# if file exists and is not empty, clear it
elif [ -f "${CLIPFILE}" ] && [ -n "$(cat "$CLIPFILE")" ]; then
	printf "${green}Clearing ${bold}${orange}Clipman${normal}${green}, ${bold}%s${normal}${green} cleared!\n" "$CLIPFILE"
    /usr/bin/echo "" | /usr/bin/xclip -sel c && /usr/bin/echo "" > "$CLIPFILE"
else
	exit 1
fi
exit 0

