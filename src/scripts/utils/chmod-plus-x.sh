#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
git add "$PROJECT_ROOT"
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec git update-index --chmod=+x {} \;
find "$PROJECT_ROOT" -type f -iname "*.sh" -exec chmod +x {} \;
echo "$script: Finished."
