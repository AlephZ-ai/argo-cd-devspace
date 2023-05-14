#!/usr/bin/env zsh
#shellcheck shell=bash
git add "$KINDEST_ARGO_CD_PROJECT_ROOT"
git update-index --chmod=+x "run"
chmod +x "run"
find "$KINDEST_ARGO_CD_PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x "{}" \;
find "$KINDEST_ARGO_CD_PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x "{}" \;
