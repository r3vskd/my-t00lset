#!/bin/bash

# Prompt the user for the wordlist file
read -p "Enter the wordlist file path: " wordlist

# Check if the wordlist file exists
if [ ! -e "$wordlist" ]; then
    echo "Wordlist file '$wordlist' not found."
    exit 1
fi

# Loop through the URLs in the wordlist and retrieve HTTP status codes
while IFS= read -r url; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    echo "URL: $url - HTTP status code: $status_code"
done < "$wordlist"
