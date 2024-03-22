#!/bin/sh

# Check if a filename is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Extract the current version string
VERSIONSTR=$(grep -E "VERSION=\"[0-9.]+\"" "$1")

# Check if the VERSION line exists in the file
if [ -z "$VERSIONSTR" ]; then
    echo "VERSION line not found in $1"
    exit 1
fi

# Extract the numeric part of the version string and increment it by 0.1
OLD_VERSION=$(echo "$VERSIONSTR" | sed -E 's/VERSION="([0-9]+)\.([0-9]+)"/\1.\2/')
NEW_VERSION=$(awk -v old_ver="$OLD_VERSION" 'BEGIN { split(old_ver, parts, /\./); if (parts[2] == 9) { print parts[1] + 1 ".0" } else { print parts[1] "." parts[2] + 1 } }')

# Perform the replacement using awk
awk -v old="$VERSIONSTR" -v new="VERSION=\"$NEW_VERSION\"" '{gsub(old, new)} 1' "$1" > "${1}.tmp" && mv "${1}.tmp" "$1" || exit 1

echo "Version in $1 incremented to $NEW_VERSION"
