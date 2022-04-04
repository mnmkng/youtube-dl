#!/bin/bash

set -e

echo "Reading URL"
URL=$(apify actor:get-input | jq -r '.url')

echo "Downloading: ${URL}"
youtube-dl "${URL}" --newline -v -o >(apify actor:set-value -c 'video/mp4' VIDEO)
sleep 10
