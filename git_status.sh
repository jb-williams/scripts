#!/bin/sh
# - show the status of a git repo on my terminal prompt if .bashrc is sourced - #
# ----------------------- when in the git repo directory ---------------------- #

my_git_status="$(git rev-parse --abbrev-ref HEAD)($(git status -s | awk '{print $1}' | sort -u | tr -d '\n' 2>/dev/null))"
printf "%s" "${my_git_status}" 2>/dev/null || exit 1
exit 0
