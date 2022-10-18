#!/bin/bash
a=`echo "Pid=1 : PPid=2 : AST=65" | awk -F':' '{print $2}' | tr '=' ' ' | awk -F' ' '{print $2}'`
echo $a