#!/bin/sh
# mainly made to quickly copy text from VI/M to the clipboard as well as a
# session temporary file, but will take any data piped to it
/usr/bin/tee "${1}" 2>/dev/null | /usr/bin/xclip -f -sel c \
	&& "${SCRIPTSDIR}"/cpclpxf

