#!/usr/bin/env bash
# Usage: scrape.sh TAG
# Turns all Instructables under a chosen tag in the RSS feed into PDFs
# Not perfect but gets the job done.
# html2pdf="C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe" # If using using windows and wkhtmltopdf is not in PATH
scrape(){
	baseUrl="http://www.instructables.com/tag/$1/rss.xml"
	merge="?ALLSTEPS"
	urlList=($(wget -qO- "$baseUrl" | sed -r 's/.*(http[^"]*)".*/\1/g' | grep -i link | sed 's/<link>//;s/<\/link>//;s/<title>.*<\/title>//;s/    //;/^\s*$/d;1d' | sort -u))
	for i in "${urlList[@]}"; do
		fname=$(wget -qO- "$i$merge" | awk 'BEGIN{IGNORECASE=1;FS="<title>|</title>";RS=EOF} {print $2}' | sed '/^$/d;s/ - All//;s/\://' | awk '{$1=$1}{ print }')
		echo "$fname"
		if [ -z $html2pdf]; then
			html2pdf "$i$merge" "$fname".pdf
		else
			"$html2pdf" "$i$merge" "$fname".pdf
		fi
	done
	# // DEBUG //
	# Print the list of urls grabbed from the RSS feed
	# echo "${urlList[@]}"
}
scrape $1