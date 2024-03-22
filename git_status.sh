#!/bin/sh
MY_GIT_STATUS="$(git rev-parse --abbrev-ref HEAD)($(git status -s | awk '{print $1}' | sort -u | tr -d '\n' 2>/dev/null))"
printf "%s" "$MY_GIT_STATUS" 2>/dev/null || exit 1
exit 0
