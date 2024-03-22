#!/bin/sh
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

if [ -f "${CLIPFILE}" ]; then
	"$HOME"/.cargo/bin/bat -p "$CLIPFILE"
else
    /usr/bin/touch "$CLIPFILE" \
		&& /usr/bin/chmod 600 "$CLIPFILE" \
		&& printf "%s\n" "$(/usr/bin/xclip -sel c -o)" >> "$CLIPFILE" \
		&& printf "${green}No ${bold}${orange}Clipman${normal}${green}, empty ${bold}%s${normal}${green} created!\n" "$CLIPFILE" \
		&& "$HOME"/.cargo/bin/bat -p "$CLIPFILE"
fi


