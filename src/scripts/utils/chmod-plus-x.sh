#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
git add "$PROJECT_ROOT"
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x "{}" \;
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x "{}" \;
echo "$script: Finished."
