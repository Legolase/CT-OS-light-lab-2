#!/bin/bash
./iv.res/helper.bash `ps -l -ax | sed "s/ \{2,\}/ /g" | cut -d ' ' -f 3,4 | tail -n +2 | sort -nk2`