#!/usr/bin/env bash
i="$0"
echo "$i: Started chmod+xing scripts."
git add "$KINDEST_ARGO_CD_PROJECT_ROOT"
git update-index --chmod=+x "run"
chmod +x "run"
find "$KINDEST_ARGO_CD_PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x "{}" \;
find "$KINDEST_ARGO_CD_PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x "{}" \;
echo "$i: Finished chmod+xing scripts."
