#!/bin/bash
ps aux | grep -e "^nikita*" | wc -l > i.res/file.out
ps aux | grep -e "^nikita*" | sed "s/\ \{2,\}/ /g" | cut -d ' ' -f 2,11 - | tr ' ' ':' >> i.res/file.out