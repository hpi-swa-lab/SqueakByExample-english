#!/bin/sh
# Inspired by https://joeyrobert.org/2016/07/13/artifact-deployment-via-google-drive/

if [ -z "$1" ]; then
	read -p "File to export? " TARGET
else
	TARGET=$1
fi

echo "I will now export the build file $TARGET to Google Drive."

# Note: This token may expire after some time. Just create a fake account and update the token below to reactive it :P
GDRIVE_REFRESH_TOKEN="1//09E6QalRd0WHbCgYIARAAGAkSNwF-L9IrA4CQiIhYB_RUnaJYYy9h76ShYfqYLioZdIyZMpD9x4replF0JYuRZRLfwHL1PybqdpI"
GDRIVE_FILE="1JND416mbf-zEHH9ojUt4IGzI5YSQH9GS"
GDRIVE_URL="https://drive.google.com/drive/folders/1tNIvN-9Vx8djNZYfSYuqhjheb-EgJuTc?usp=sharing"

echo "Downloading gdrive ..."
GDRIVE_URL='https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download'
mkdir -p "bin"
curl -fSL "${GDRIVE_URL}" -o ./bin/gdrive --progress-bar
chmod +x ./bin/gdrive

FIXED_BRANCH=$(echo $BRANCH | sed 's/\//-/g')
./bin/gdrive update $GDRIVE_FILE --refresh-token $GDRIVE_REFRESH_TOKEN $TARGET

echo -e "\e[1mFinished Google Drive upload."
echo -e "\e[1mYou can download the PDF here: \e[34mhttps://drive.google.com/open?id=$GDRIVE_FILE"
