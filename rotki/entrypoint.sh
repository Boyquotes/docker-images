#!/bin/bash

ls -l
ls -l ../
source /usr/local/bin/virtualenvwrapper.sh
#mkvirtualenv rotki -p /usr/bin/python3.10 &&
echo 'VIRTUAL ENV'
echo $VIRTUAL_ENV
workon rotki
echo $VIRTUAL_ENV
cd ..
pwd
pip3 install -e .
ls
cd -
pwd
pnpm run dev:web
tail -f /dev/null
# pnpm run dev:web