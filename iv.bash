#!/bin/bash
./iv.res/helper.bash `ps aux | sed "s/ \{2,\}/ /g" | cut -d ' ' -f 2` | sort -t$'\t' -nk2 | cut -f 1