#!/bin/bash
set -eou pipefail
# query cht.sh about items
# add items to the arrays to make them available to query
languages=("bash
sh
golang
perl
rust
c
cpp
lua")

core_utilss=("xargs
bc
test
find
mv
sed
awk")

my_selected=$(printf "%s\n%s" "${languages[@]}" "${core_utilss[@]}" | fzf --border --margin=5% --color=dark --height=100% --reverse)
read -p "query: " -r query
# read -p "query(lang keyword): " -r query

if printf "%s" "${languages[@]}" | grep -qs "${my_selected}"; then
	tmux neww bash -c "curl cht.sh/${my_selected}/$(echo "${query}" | tr ' ' '+') & while [ : ]; do sleep 1; done" || exit 1
else
	tmux neww bash -c "curl cht.sh/${my_selected}~$(echo "${query}" | tr ' ' '+') & while [ : ]; do sleep 1; done" || exit 1
fi
