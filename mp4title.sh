#!/bin/bash -   
#title          :mp4title.sh
#description    :A script to automatically update the MP4 metadata title with the filename
#author         :Kyle M. Perkins
#date           :20160623
#version        :0.22
#usage          :./mp4title.sh
#notes          :       
#bash_version   :4.3.42(1)-release
#============================================================================

#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for f in $(find . -name "*.mp4"| sort -V)
do
	#echo "Filepath: $f"
	# Get filename (minus extension)
	filenameExt="${f##*/}"
	filename="${filenameExt%.*}"
	echo -n "Processing $filename..."

	# Get title (if exists)
	read NAME <<< $(mp4info $f | awk '/Name/ { print $0 }')
	NAME=${NAME:7}

	# Compare title and filename. If !=, set. If not, pass
	#echo "\nCompare: '$NAME' and '$filename'"; # Debug
	if [ "$NAME" != $filename ]; then
		echo "Updating title to \"$filename\"";
		mp4tags -s "$filename" $f
	else
		echo "Title is the same. No action taken."
	fi
done
#echo "====";
espeak -s 125 "All file tags modified" 2>/dev/null
IFS=$SAVEIFS
