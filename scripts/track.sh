#!/bin/bash
Track=$(pidof deadbeef); wmctrl -lp | sed '/'$Track'/!d' | awk '{$1="";$2="";$3="";$4="";print $0}' | sed 's/    //;s/Unknown artist - //;s/^/\[♪\] /'
