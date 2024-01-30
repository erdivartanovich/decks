#!/usr/bin/env sh

# Function to URL decode a string
urldecode() {
    echo -e "$(sed 's/+/ /g; s/%\([0-9a-fA-F][0-9a-fA-F]\)/\\x\1/g')"
}

# Get the file path from the query string and URL decode it
file_path=$(echo "$QUERY_STRING" | awk -F'=' '{print $2}' | urldecode)

# Display the content of the specified configuration file
echo "Content-type: text/plain"
echo
cat "$file_path"
