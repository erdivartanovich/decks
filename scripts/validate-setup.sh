#!/usr/bin/env sh

if  find ".env" > /dev/null 2>&1; then
   exit 0
else
   echo "file .env not exists"
   echo "please add new .env file first!"
   exit 1
fi
