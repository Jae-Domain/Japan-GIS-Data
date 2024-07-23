#!/bin/bash

# Use this file to download slope data
base_url="https://nlftp.mlit.go.jp/ksj/gml/data/G04-d/G04-d-11"

# User-Agent string to mimic a web browser
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"

# Iterate over the range of numbers
for N in $(seq 4728 6842); do
    # Construct the URL
    url="${base_url}/G04-d-11_${N}-jgd_GML.zip"
    
    # Check if the file exists on the server
    if curl --output /dev/null --silent --head --fail -A "$user_agent" "$url"; then
        echo "Downloading ${url}..."
        wget --user-agent="$user_agent" "$url"
    else
        echo "File ${url} does not exist."
    fi
done

