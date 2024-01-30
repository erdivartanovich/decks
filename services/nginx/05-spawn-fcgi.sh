#!/usr/bin/env sh

/usr/bin/spawn-fcgi -s /var/run/fcgiwrap.socket -M 766 /usr/bin/fcgiwrap
