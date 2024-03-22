#!/bin/bash
# set -eou pipefail


/usr/bin/pandoc "$1" \
    -f gfm \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
    --pdf-engine=xelatex \
    --standalone \
    --highlight-style breezedark \
	--columns=80 \
	--wrap=preserve \
    -o "$2"
#   --toc \

