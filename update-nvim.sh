#!/usr/bin/env bash
set -x
# https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# if [ ! -d "${TEMPDIR}" ] || [ -z "${TEMPDIR}" ]; then
# 	mktemp -d --suffix="-$(date '+%m-%d-%Y')" 2>/dev/null
# 	TEMPDIR="$(/bin/ls -tldr "${TEMP}"/tmp.* 2>/dev/null | head -1 | awk '{print $NF}' 2>/dev/null)"
# fi
TEMPDIR="/tmp"
cd "${TEMPDIR}" || exit 2

# ------------------------------- cURL nvim page ------------------------------ #
curl -L https://github.com/neovim/neovim/releases/latest -o "${TEMPDIR}/tmp-nvim-curl.txt"
# curl https://github.com/neovim/neovim/releases/ -o "${TEMPDIR}/tmp-nvim-curl.txt"
# --------------------------------------  ------------------------------------- #

# --------------------------------- Temp cURL --------------------------------- #
tempCurl="${TEMPDIR}/tmp-nvim-curl.txt"
# --------------------------------------  ------------------------------------- #

# --------------------------------- WebVersion -------------------------------- #
nvimWebVer="$(grep -E "NVIM v[0-1]{1}.[0-9]{2,}.[0-9]{1}" -m 1 "${tempCurl}" | awk -F'"' '{print $NF}' | awk '{print $NF}')"
# ------------------------------- my vim version ------------------------------ #
myNvimVer="$(nvim -v | head -1 | awk '{print $NF}')"
# --------------------------------------  ------------------------------------- #

# ----------------------------------- WebSha ---------------------------------- #
# 	nvimWebSHA="$(grep -i "nvim-linux64.tar.gz" -m 3 "${tempCurl}" | tail -1 | cut -d '"' -f 4 | cut -d ' ' -f 1)"
# --------------------------- sha of downloaded file -------------------------- #
# 	downloadedSHA="$(shasum -a256 "${TEMPDIR}"/nvim-linux64.tar.gz | cut -d' ' -f 1)"
# --------------------------------------  ------------------------------------- #

if [ "${nvimWebVer}" = "${myNvimVer}" ]; then
	wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O "${TEMPDIR}"/nvim-linux64.tar.gz
# ----------------------------------- WebSha ---------------------------------- #
 	nvimWebSHA="$(grep -i "nvim-linux64.tar.gz" -m 3 "${tempCurl}" | tail -1 | cut -d '"' -f 4 | cut -d ' ' -f 1)"
# --------------------------- sha of downloaded file -------------------------- #
	downloadedSHA="$(shasum -a256 "${TEMPDIR}"/nvim-linux64.tar.gz | cut -d' ' -f 1)"
# --------------------------------------  ------------------------------------- #

# ---------------------- Check if the sha's are the same ---------------------- #
	printf "%s %s %s %s" "${nvimWebSHA}" "${downloadedSHA}" "${nvimWebVer}" "${myNvimVer}" | awk '{
		if ($1==$2 && $3==$4) {
			print "Version and SHA256SUM match, continuing to install"; exit 0
		} else {
			print "Version and SHA256SUM DO NOT MATCH!!! DO NOT PROCEED!!!"; exit 1
		}
	}'

	if [ "${?}" -eq 0 ]; then
		# un tar gz and move to /opt/
		tar xzf "${TEMPDIR}/nvim-linux64.tar.gz" \
			&& sudo cp -r "${TEMPDIR}/nvim-linux64" /opt/ \
			&& sudo chown -R root:binford /opt/nvim-linux64/ \
			&& rm -rf "${TEMPDIR}/nvim-linux64*"
	else 
		exit 1
	fi
else
	printf "%s %s %s %s" "${nvimWebSHA}" "${downloadedSHA}" "${nvimWebVer}" "${myNvimVer}"
	echo "up to date"
fi
cd "${OLDPWD}" || exit 2
exit 0
