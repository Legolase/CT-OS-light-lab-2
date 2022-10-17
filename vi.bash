#/bin/bash
grep -s "VmSize" `find /proc -maxdepth 2 -type f -name status` | tr ":\t/" ' ' | sed "s/ \{2,\}/ /g" | cut -d ' ' -f 3,6 | sort -nk2 | tail -1
