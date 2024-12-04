#!/bin/bash

PAGE_URL=$1

URLS=$(curl -s "$PAGE_URL" | \
grep -oP 'downloadDirect\(\K[^)]+(?=\))' | \
tr -d "'\"")

for URL in $URLS; do
  echo "Downloading $URL..."
    FILENAME=$(basename "$URL")
    curl "$URL" --output $FILENAME
done
