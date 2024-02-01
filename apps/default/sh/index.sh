#!/bin/sh

echo "Content-type: text/plain"
echo ""

for file_path in /etc/nginx/conf.d/*.conf; do
    if [ -f "$file_path" ]; then
        sitename=$(basename "$file_path" .conf)
        server_name=$(awk '/^\s*server_name/ {gsub(/;/,"",$2); print $2}' "$file_path")
        if [ ! "$sitename" =  'default' ]; then
            printf "%s:%s\n" "$sitename" "$server_name"
        fi
    fi
done
