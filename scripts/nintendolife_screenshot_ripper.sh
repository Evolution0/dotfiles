#!/bin/bash
#while read line
#	do
#			i=0
#			gname=$(echo "$line" | sed 's/http.*\:\/\/.*\///;s/"//g;s/_/ /g;s/\b\(.\)/\u\1/g')
#			flist=($(wget -q -O - "$line" | grep -o '<a .*href=.*>' | sed -e 's/<a/\n<a/g;s/<a .*href=['"'"'"]//;s/["'"'"'].*$//;/^$/ d' | grep -o '.*images.*'))
#			mkdir "$gname"
#			while [[ "$i" -ne "${#flist[@]}" ]]
#				do
#					wget -nv --output-document="$gname/$gname$i.jpg" ${flist[$i]}
#					i=$((i+1))
#				done
#done < gamelist.txt


for line in $(cat gamelist.txt)
	do
			i=0
			gname=$(echo "$line" | sed 's/http.*\:\/\/.*\///;s/"//g;s/_/ /g;s/\b\(.\)/\u\1/g')
			flist=($(wget -q -O - "$line" | grep -o '<a .*href=.*>' | sed -e 's/<a/\n<a/g;s/<a .*href=['"'"'"]//;s/["'"'"'].*$//;/^$/ d' | grep -o '.*images.*'))
			mkdir "$gname"
			while [[ "$i" -ne "${#flist[@]}" ]]
				do
					wget -nv --output-document="$gname/$gname$i.jpg" ${flist[$i]}
					i=$((i+1))
				done
done
