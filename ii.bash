#!/bin/bash
ps aux | sed "s/\ \{2,\}/ /g" | cut -d ' ' -f 2,11 | grep -e " /sbin/*" > ii.res/file.out