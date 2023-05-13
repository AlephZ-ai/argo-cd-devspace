#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$(dirname "$scriptPath")")"
script="$scriptPath/$script"
echo "$script: Starting."
"$scriptsPath/devspace/setup/set-env-vars.sh"
"$scriptsPath/git/configure-credential-manager.sh"
"$scriptsPath/argocd/self-manage.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$script: Finished."
