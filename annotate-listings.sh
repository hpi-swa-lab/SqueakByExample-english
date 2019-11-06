for file in $(find ListingSources -type f -name "*.st"); do
	if [[ $file =~ package\/(.*)\.(class|extension)\/ ]]; then
		echo -e "${BASH_REMATCH[1]}>>>$(tail -n +2 "$file")" > $file
	fi
done
