#!/bin/bash -e
if [ -z $1 ] || [ -z $2 ]; then
	echo "usage: $(basename $0) <source_directory> <target_directory>"
	exit
fi

SOURCE=$1
if [ ! -d $SOURCE ]; then
	>&2 echo "No valid source directory specified"
	exit 1
fi
TARGET=$2

mkdir -p $TARGET

for file in $(find $SOURCE -type f -name "*.st"); do
	if [[ $file =~ package\/(.*)\.(class|extension)\/ ]]; then
		new_file="${TARGET}/$(cut -sd / -f 2 <<< "$file")"
		mkdir -p $(dirname $new_file)
		echo -e "${BASH_REMATCH[1]}>>>$(tail -n +2 "$file")" > $new_file
	fi
done
