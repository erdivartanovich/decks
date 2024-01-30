#!/usr/bin/env sh

if [ ! "$1" ]; then
    echo "Error. Please define the project root directory!"
    echo "List of available projects:"
    ls -1
    exit 1
fi
# give host user permissions
sudo chown -R 1000:www-data "$1"
sudo find "$1" -type f -exec chmod 664 {} \;
sudo find "$1" -type d -exec chmod 775 {} \;

#give web-server permissions
sudo chgrp -R www-data "$1"/storage "$1"/bootstrap/cache
sudo chmod -R ug+rwx "$1"/storage "$1"/bootstrap/cache
