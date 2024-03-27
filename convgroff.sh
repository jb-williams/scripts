#!/bin/sh
# convert groff ms format to pdf
#set -eou pipefail
groff -ms -T pdf -tle "${1}" > "${2}"
