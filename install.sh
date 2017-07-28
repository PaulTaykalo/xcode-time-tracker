#!/bin/sh
# Creating if not exist
[ -d ~/.timecheck ] || mkdir ~/.timecheck

cp ./scripts/project_end.py ~/.timecheck/
cp ./scripts/project_start.py ~/.timecheck/

echo "Everything is ready. Now it's time to configure Xcode behaviors (see README.md)"