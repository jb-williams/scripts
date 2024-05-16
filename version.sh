#!/bin/sh

# --------------- Check if a filename is provided as an argument -------------- #
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# --------------------- Extract the current version string -------------------- #
version_str=$(grep -E "VERSION=\"[0-9.]+\"" "$1")

# ---------------- Check if the VERSION line exists in the file --------------- #
if [ -z "$version_str" ]; then
    echo "VERSION line not found in $1"
    exit 1
fi

# --- Extract the numeric part of the version string and increment it by 0.1 -- #
old_version=$(echo "$version_str" | sed -E 's/VERSION="([0-9]+)\.([0-9]+)"/\1.\2/')
new_version=$(awk -v old_ver="$old_version" 'BEGIN { split(old_ver, parts, /\./); if (parts[2] == 9) { print parts[1] + 1 ".0" } else { print parts[1] "." parts[2] + 1 } }')

# --------------------- Perform the replacement using awk --------------------- #
awk -v old="$version_str" -v new="VERSION=\"$new_version\"" '{gsub(old, new)} 1' "$1" > "${1}.tmp" && mv "${1}.tmp" "$1" || exit 1

echo "Version in $1 incremented to $new_version"
