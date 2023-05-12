#!/usr/bin/env bash
git add "$PROJECT_ROOT"
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x {} \;
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x {} \;
