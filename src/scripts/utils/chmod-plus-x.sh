#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
git add "$KINDEST_ARGO_CD_PROJECT_ROOT"
find "$KINDEST_ARGO_CD_PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x "{}" \;
find "$KINDEST_ARGO_CD_PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x "{}" \;
find "$KINDEST_ARGO_CD_PROJECT_ROOT/commands" -type f -iname "*" -exec git update-index --chmod=+x "{}" \;
find "$KINDEST_ARGO_CD_PROJECT_ROOT/commands" -type f -iname "*" -exec chmod +x "{}" \;
echo "$script: Finished."
