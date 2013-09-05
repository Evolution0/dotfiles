#!/bin/bash
Vid=$(pidof smplayer2); wmctrl -lp | sed '/'$Vid'/!d' | awk '{$1="";$2="";$3="";$4="";print $0 }' | sed 's/    //;s/ - SMPlayer2//;s/ - / - Episode\:/;s/ \[.*\].mkv//;s/^/\[♪\] /'
