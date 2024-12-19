#!/bin/bash

PAGE_URL=$1
DIRECTORY_NAME=$(basename $PAGE_URL)

mkdir $DIRECTORY_NAME

URLS=$(curl -s "$PAGE_URL" | \
grep -oP 'downloadDirect\(\K[^)]+(?=\))' | \
tr -d "'\"")

for URL in $URLS; do
  echo "Downloading $URL..."
    FILENAME=$(basename "$URL")
    curl "$URL" --output ./$DIRECTORY_NAME/$FILENAME
done
