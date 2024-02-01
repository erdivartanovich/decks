#!/usr/bin/env sh

# Function to URL decode a string
urldecode() {
    echo -e "$(sed 's/+/ /g; s/%\([0-9a-fA-F][0-9a-fA-F]\)/\\x\1/g')"
}

# Get the file path from the query string and URL decode it
site=$(echo "$QUERY_STRING" | awk -F'=' '{print $2}' | urldecode)
file_path="/etc/nginx/conf.d/$site.conf"

if [ ! -e "$file_path" ]; then
    echo "Status: 404"
    echo
else
    # Display the content of the specified configuration file
    echo "Content-type: text/plain"
    echo "Status: 200"
    echo
    echo "$QUERY_STRING"
    echo "configuration:"
    echo
    cat "$file_path"
fi
