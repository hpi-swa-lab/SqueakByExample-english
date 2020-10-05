#!/bin/sh 
# Inspired by https://joeyrobert.org/2016/07/13/artifact-deployment-via-google-drive/
set -e

OPERATION=$1

./travis_fold -start

GDRIVE=./bin/gdrive
# Note: This token may expire after some time. Just create a fake account and update the token below to reactive it :P
GDRIVE_REFRESH_TOKEN="1//09E6QalRd0WHbCgYIARAAGAkSNwF-L9IrA4CQiIhYB_RUnaJYYy9h76ShYfqYLioZdIyZMpD9x4replF0JYuRZRLfwHL1PybqdpI"
GDRIVE_ARGS="--refresh-token ${GDRIVE_REFRESH_TOKEN}"
GDRIVE_FOLDER="1tNIvN-9Vx8djNZYfSYuqhjheb-EgJuTc"
GDRIVE_URL="https://drive.google.com/drive/folders/1tNIvN-9Vx8djNZYfSYuqhjheb-EgJuTc?usp=sharing"

install_gdrive() {
	echo "Downloading gdrive ..."
	GDRIVE_URL='https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download'
	mkdir -p $(dirname $GDRIVE)
	curl -fSL "${GDRIVE_URL}" -o $GDRIVE --progress-bar
	chmod +x $GDRIVE
}

find_file() {
	$GDRIVE list $GDRIVE_ARGS -q "'${GDRIVE_FOLDER}' in parents and name = '$1' and trashed = false" --no-header | awk '{print $1}'
}

find_files() {
	$GDRIVE list $GDRIVE_ARGS -q "'${GDRIVE_FOLDER}' in parents and name contains '$1' and trashed = false" --no-header | awk '{print $1}'
}

if [ ! -f $GDRIVE ]; then install_gdrive; fi

FIXED_BRANCH=$(echo $TRAVIS_BRANCH | sed 's/\//-/g')
FIXED_REPO=$(echo $TRAVIS_REPO_SLUG | sed 's/\//-/g')

case $OPERATION in
	download)
		FILE_NAME="-$FIXED_REPO-$FIXED_BRANCH.pdf"
		GDRIVE_FILES=$(find_files "$FILE_NAME")
		for GDRIVE_FILE in $GDRIVE_FILES; do
			$GDRIVE download $GDRIVE_ARGS --force $GDRIVE_FILE
		done
		rename "s/${FILE_NAME%.*}//" *$FILE_NAME
		;;
	upload)
		SOURCE=$2
		FILE_NAME="${SOURCE%.*}-$FIXED_REPO-$FIXED_BRANCH.pdf"
		GDRIVE_FILE=$(find_file $FILE_NAME)
		if [[ $GDRIVE_FILE ]]; then
			echo "Uploading new version of ${FILE_NAME} ..."
			$GDRIVE update $GDRIVE_ARGS --name $FILE_NAME $GDRIVE_FILE $SOURCE
		else
			echo "Uploading ${FILE_NAME} ..."
			$GDRIVE upload $GDRIVE_ARGS --name $FILE_NAME $SOURCE -p $GDRIVE_FOLDER
			GDRIVE_FILE=$(find_file $FILE_NAME)
		fi

		echo -e "\e[96mFinished Google Drive upload."
		echo -e "\e[96mYou can download the PDF here: \e[94mhttps://drive.google.com/open?id=$GDRIVE_FILE"
		;;
	*)
		echo "Unknown operation!"
		exit 1
esac

./travis_fold -end

