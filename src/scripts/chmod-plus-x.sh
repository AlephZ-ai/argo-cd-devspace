#!/usr/bin/env bash
git add .
find . -type f -iname "*.sh" -exec git update-index --chmod=+x {} \;
