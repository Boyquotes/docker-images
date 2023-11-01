#!/bin/bash

ls -l
ls -l ../
source /usr/local/bin/virtualenvwrapper.sh
#mkvirtualenv rotki -p /usr/bin/python3.10 &&
workon rotki
pnpm run dev:web