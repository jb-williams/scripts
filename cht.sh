#!/bin/bash
set -eou pipefail
LANGUAGES=("bash
golang
rust
c
cpp
lua")

CORE_UTILSS=("xargs
find
mv
sed
awk")

SELECTED=$(printf "%s\n%s" "${LANGUAGES[@]}" "${CORE_UTILSS[@]}" | fzf --border --margin=5% --color=dark --height=100% --reverse)
read -p "query: " -r QUERY
# read -p "query(lang keyword): " -r query

if printf "%s" "${LANGUAGES[@]}" | grep -qs "$SELECTED"; then
	tmux neww bash -c "curl cht.sh/$SELECTED/$(echo "$QUERY" | tr ' ' '+') & while [ : ]; do sleep 1; done" || exit 1
else
	tmux neww bash -c "curl cht.sh/$SELECTED~$(echo "$QUERY" | tr ' ' '+') & while [ : ]; do sleep 1; done" || exit 1
fi
