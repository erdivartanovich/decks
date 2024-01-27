#!/usr/bin/env sh

if  find "fixtures/envs" > /dev/null 2>&1; then
   exit 0
else
   echo "file envs not exists"
   echo "please add new 'fixtures/envs' file first!"
   exit 1
fi
