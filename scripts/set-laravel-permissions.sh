#!/usr/bin/env sh

# give host user permissions
WORKDIR="${1:-.}"
sudo chown -R 1000:www-data "$WORKDIR"
sudo find "$WORKDIR" -type f -exec chmod 664 {} \;
sudo find "$WORKDIR" -type d -exec chmod 775 {} \;

# give web-server permissions
sudo chgrp -R www-data storage "$WORKDIR"/bootstrap/cache
sudo chmod -R ug+rwx storage "$WORKDIR"/bootstrap/cache
