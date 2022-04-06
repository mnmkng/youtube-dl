#!/bin/bash

set -e

echo "Reading URL"
URL=$(apify actor:get-input | jq -r '.url')

echo "Fetching video information."
youtube-dl  -j "${URL}" --proxy "http://auto:${APIFY_PROXY_PASSWORD}@proxy.apify.com:8000" \
 | tee >(apify actor:set-value INFO) \
 | cat

echo "Downloading: ${URL}"
youtube-dl "${URL}" \
 --newline \
 -v \
 --proxy "http://auto:${APIFY_PROXY_PASSWORD}@proxy.apify.com:8000" \
 -o >(apify actor:set-value -c 'video/mp4' VIDEO)
# without the sleep, the video sometimes did not save
sleep 2
