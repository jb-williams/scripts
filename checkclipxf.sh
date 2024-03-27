#!/bin/sh
# checks if there is anything in the tmp clip_file, bat/cat it if so, if not,
# create tmp clip_file
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

clip_file="${TEMPDIR}/tmpclp-$(date '+%m-%d-%Y').txt"

if [ -f "${clip_file}" ]; then
	"${HOME}"/.cargo/bin/bat -p "${clip_file}"
else
    /usr/bin/touch "${clip_file}" \
		&& /usr/bin/chmod 600 "${clip_file}" \
		&& printf "%s\n" "$(/usr/bin/xclip -sel c -o)" >> "${clip_file}" \
		&& printf "${green}No ${bold}${orange}Clipman${normal}${green}, empty ${bold}%s${normal}${green} created!\n" "${clip_file}" \
		&& "${HOME}"/.cargo/bin/bat -p "${clip_file}"
fi


