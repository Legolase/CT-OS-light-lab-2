#!/bin/bash
ps aux | sed "s/\ \{2,\}/ /g" | cut -d ' ' -f 2,9 | tail -1