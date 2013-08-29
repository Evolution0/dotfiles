#!/bin/bash
# evolution@unixhub.net
# Dependencies: xwininfo (default X util), imagemagick (if you want jpg support), hsetroot

# Gets current screen resolution
res=$(xwininfo -root | sed -n 23p | grep -o -P '.{0,4}x' | sed 's/x//')
# No jpg/tiff support, but no imagemagick dependency
#imgres=$(file $1 | grep -o -P '.{0,4} x' | sed 's/ x//;s/\, //;s/ //')
# Gets image resolution
imgres=$(identify -format "%[fx:w]x%[fx:h]" $1 | grep -o -P '.{0,4}x' | sed 's/x//')

if [[ "$imgres" -eq "$res" ]] # If image is of equal res; center. probobly don't need the arg
then
	hsetroot -center "$1"
elif [[ "$imgres" -gt "$res" ]] # If image res is greater than res file/scale
then
	hsetroot -fill "$1" 
elif [[ "$imgres" -lt "513" ]] # If image res is under threshold (513) then tile
then
	hsetroot -tile "$1" 
elif [[ "$imgres" -lt "$res" ]] # If image res is lower than res but not threshold (above) fill
then
	hsetroot -fill "$1" 
else
	# Would probobly error out before even getting to this
	echo "I don't know what to do with $1. \n If the image is jpg/tiff imagemagick is required."
fi
