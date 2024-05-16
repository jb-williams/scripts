#!/bin/sh
# -------- manages copying to clipfile and makes it if it doesnt exist -------- #

# set -eo pipefail
normal="\e[0m"
bold="\e[1m"
green="\e[32m"
orange="\e[33m"
if ! command -v /usr/bin/fzf &>/dev/null; then
	printf "REQUIRES PROGRAM FZF!" && exit 2
fi
if [ ! -d "${TEMPDIR}" ] || [ -z "${TEMPDIR}" ]; then
	mktemp -d --suffix="-$(date '+%m-%d-%Y')" &>/dev/null
	TEMPDIR="$(/bin/ls -ltdr ${TEMP}/tmp.* 2>/dev/null | head -1 | awk '{print $NF}' 2>/dev/null)"
else
	exit 1
fi

clip_file="${TEMPDIR}/tmpclp-$(date '+%m-%d-%Y').txt"

# if clip_file exists copy clipboard into clipfile
if [ -f "${clip_file}" ]; then
    /usr/bin/echo -e "$(/usr/bin/xclip -sel c -o)" >> "${clip_file}"

# if clip_file exists, create it, then copy clipboard into clipfile
else
    /usr/bin/touch "${clip_file}" \
		&& /usr/bin/chmod 600 "${clip_file}" \
		&& /usr/bin/echo -e "$(/usr/bin/xclip -sel c -o)" >> "${clip_file}"
# 		&& /usr/bin/echo -e "$(/usr/bin/xclip -sel c -o)" >> "${clip_file}" \
# 		&& printf "${green}No ${bold}${orange}Clipman${normal}${green}, empty ${bold}%s${normal}${green} created!" "${clip_file}"
fi
exit 0

