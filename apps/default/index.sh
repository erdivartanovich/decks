#!/bin/sh

echo "Content-type: text/html"
echo ""
echo "<html>"
echo "<head>"
echo "<title>DECKS</title>"
echo "</head>"
echo "<body>"
echo "<h1>Welcome to DECKS!</h1>"
echo "<p>The Development Environment Containerized Services.</p>"
echo "<h2>Your Project List:</h2>"
echo "<ul>"

for file_path in /etc/nginx/conf.d/*.conf; do
    if [ -f "$file_path" ]; then
        sitename=$(basename "$file_path" .conf)
        server_name=$(awk '/^\s*server_name/ {gsub(/;/,"",$2); print $2}' "$file_path")
        echo "<li>"
        echo "<a href=\"http://$server_name\" target=\"_blank\">$sitename</a>"
        echo "<a href=\"http://$server_name\" target=\"_blank\">$sitename</a>"
        echo "<button class=\"view-button\" data-config-file=\"$file_path\">View Configuration</button>"
        echo "</li>"
    fi
done
echo "</ul>"
echo "<script>"
echo "document.addEventListener('DOMContentLoaded', function() {"
echo "  var buttons = document.querySelectorAll('.view-button');"
echo "  buttons.forEach(function(button) {"
echo "    button.addEventListener('click', function() {"
echo "      var configFile = this.getAttribute('data-config-file');"
echo "      window.location.href='show-config?file=' + encodeURIComponent(configFile);"
echo "    });"
echo "  });"
echo "});"
echo "</script>"
echo "</body>"
echo "</html>"
