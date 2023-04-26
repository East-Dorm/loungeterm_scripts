#!/bin/bash
set -euo pipefail

if [ "$#" -eq 0 ]
  then echo "No search term supplied!"
  exit 1
fi

# Replace spaces with pluses to form a valid search url
space=" "
plus="+"
search_term="${1//$space/$plus}"

# Perform the search and store the results in /tmp/{query}_results.html
yt_search_prefix="https://www.youtube.com/results?search_query="
yt_search_url=$yt_search_prefix$search_term
filename=/tmp/"$search_term"_results.html
wget -O "$filename" "$yt_search_url" 2> /dev/null

# Parse the results for the first URL
yt_final_url=$(~/bin/list_video_urls.py "$filename" | head -n1)

# Echo url to parent process
echo "$yt_final_url"

# Clean up
rm "$filename"

