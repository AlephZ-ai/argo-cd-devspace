#!/usr/bin/env bash
git add .
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x {} \;
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x {} \;
