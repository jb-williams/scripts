#!/bin/bash
# ------- makes tmp clip_file if it doesn't exist, clears it if it does ------- #

#set -eou pipefail
normal="\e[0m"
bold="\e[1m"
green="\e[32m"
orange="\e[33m"
if ! command -v fzf &>/dev/null; then
	printf "REQUIRES PROGRAM FZF!" && exit 2
fi

if [ -z "${TEMPDIR}" ] || [ ! -d "${TEMPDIR}" ]; then
	mktemp -d --suffix="-$(date '+%m-%d-%Y')" &>/dev/null
	TEMPDIR="$(/bin/ls -ltdr ${TEMP}/tmp.* 2>/dev/null | head -1 | awk '{print $NF}' 2>/dev/null)"
fi

clip_file="${TEMPDIR}/tmpclp-$(date '+%m-%d-%Y').txt"

# check if file exists
if [ ! -f "${clip_file}" ]; then
	printf "${green}No ${bold}${orange}Clipman${normal}${green}, ${bold}%s${normal}${green} not created yet!\n" "${clip_file}"

# if file exists, check if it is empty
elif [ -f "${clip_file}" ] && [ -z "$(cat "${clip_file}")" ]; then
	printf "${green}Empty ${bold}${orange}Clipman${normal}${green}, ${bold}%s${normal}${green} created but empty!\n" "${clip_file}"

# if file exists and is not empty, clear it
elif [ -f "${clip_file}" ] && [ -n "$(cat "${clip_file}")" ]; then
	printf "${green}Clearing ${bold}${orange}Clipman${normal}${green}, ${bold}%s${normal}${green} cleared!\n" "${clip_file}"
    echo "" | xclip -sel c && echo "" > "${clip_file}"
else
	exit 1
fi
exit 0

