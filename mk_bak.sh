#!/bin/sh
# set -x
#
orig_file="$(printf "%s" "${1}" | cut -d '.' -f 1)"
orig_extension=".$(printf "%s" "${1}" | cut -d '.' -f 2)"
add_bak=".bak"
bak_date="-$(date '+%Y-%m-%d')"

if [ "${orig_file}" ] && [ "${orig_extension}" ]; then
	if ! printf "%s" "${1}" | grep '\.' >/dev/null 2>&1; then
	# 	cp -rvi --strip-trailing-slashes "${orig_file}" "${orig_file}""${bak_date}""${add_bak}"
	# 	tar -cJvf "${orig_file}"${orig_extension}""${bak_date}""${add_bak}".tar.xz
		printf "%s%s%s\n" "${orig_file}" "${bak_date}" "${add_bak}"
	elif printf "%s" "${1}" | grep '\.' >/dev/null 2>&1; then
	# 	cp -rvi --strip-trailing-slashes "${orig_file}" "${orig_file}""${bak_date}""${orig_extension}""${add_bak}"
		printf "%s%s%s%s\n" "${orig_file}" "${bak_date}" "${orig_extension}" "${add_bak}"
	else
		printf "%s\n" "Some Other Error is Occurring"
	fi
else
	printf "%s\n" "Please supply a file or directory name"
fi
