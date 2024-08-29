#!/bin/sh
# --------------------- working on making a backup script --------------------- #
# ---------------------- probably going to use tar and xz --------------------- #
# ------------------------------- instead of cp ------------------------------- #

# set -x
#
orig_file="$(printf "%s" "${1}" | cut -d '.' -f 1)"
orig_extension=".$(printf "%s" "${1}" | cut -d '.' -f 2)"
add_bak=".bak"
bak_date="-$(date '+%Y-%m-%d')"
tar_ext=".tar.xz"

if [ "${orig_file}" ] && [ "${orig_extension}" ]; then
	if ! printf "%s" "${1}" | grep '\.' >/dev/null 2>&1; then
# 	 	cp -rvi --strip-trailing-slashes "${orig_file}" "${orig_file}""${bak_date}""${add_bak}"
		tar_file="$(printf "%s%s%s%s" "${orig_file}" "${bak_date}" "${add_bak}" "${tar_ext}")"
# 		printf "%s %s" "${1}" "${tar_file}"
		tar -cvJf "${tar_file}" "${1}"

	elif printf "%s" "${*}" | grep '\.' >/dev/null 2>&1; then
# 	 	cp -rvi --strip-trailing-slashes "${orig_file}" "${orig_file}""${bak_date}""${orig_extension}""${add_bak}"
		tar_file="$(printf "%s%s%s%s%s"  "${orig_file}" "${orig_extension}" "${bak_date}" "${add_bak}" "${tar_ext}")"
# 		printf "%s %s" "${1}" "${tar_file}"
		tar -cvJf "${tar_file}" "${1}"

	else
		printf "%s\n" "Some Other Error is Occurring"
	fi

elif printf "%s" "${*}" | grep '^\.' >/dev/null 2>&1; then
	tar_file="$(printf "%s%s%s%s"  "${orig_extension}" "${bak_date}" "${add_bak}" "${tar_ext}")"
# 	printf "%s %s" "${1}" "${tar_file}"
	tar -cvJf "${tar_file}" "${1}"

else
	printf "%s\n" "Please supply a file or directory name"
fi
