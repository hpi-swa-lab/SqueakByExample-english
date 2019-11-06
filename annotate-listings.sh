#!/bin/sh 
for file in $(find ListingSources -type f -name "*.st"); do
	if [[ $file =~ package\/(.*)\.class\/ ]]; then
		echo -e "${BASH_REMATCH[1]}'>>>'$(cat $file)" > $file
	fi
done
