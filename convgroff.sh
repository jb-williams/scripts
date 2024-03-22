#!/bin/sh
#set -eou pipefail

groff -ms -T pdf -tle "$1" > "$2"
# groff -ms -T html -tle $1 > $2
