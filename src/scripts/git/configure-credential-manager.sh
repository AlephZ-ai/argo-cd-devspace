#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
"$scriptsPath/devspace/setup/set-env-vars.sh"
echo "$script: Starting."
git-credential-manager configure
echo "$script: Finished."
