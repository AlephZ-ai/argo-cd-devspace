#!/usr/bin/env zsh
git add .
find . -type f -iname "*.sh" -exec git update-index --chmod=+x {} \;
find . -type f -iname "*.sh" -exec chmod +x {} \;
