#!/bin/sh
# weekly commonly
# set -eou pipefail

/usr/bin/sudo /usr/bin/apt update -y && /usr/bin/sudo /usr/bin/apt upgrade -y && /usr/bin/sudo /usr/bin/apt full-upgrade -y && /usr/bin/sudo /usr/bin/apt-get autoremove --purge -y && /usr/bin/sudo /usr/bin/apt clean -y
# /usr/bin/sudo /usr/bin/apt update -y && /usr/bin/sudo /usr/bin/apt upgrade -y --allow-downgrades && /usr/bin/sudo /usr/bin/apt full-upgrade -y --allow-downgrades && /usr/bin/sudo /usr/bin/apt-get autoremove --purge -y && /usr/bin/sudo /usr/bin/apt clean -y
