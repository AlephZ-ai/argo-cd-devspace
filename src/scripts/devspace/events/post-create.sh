#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/dotnet/configure-credential-manager.sh"
"$SCRIPTS_ROOT/argocd/self-manage.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$script: Finished."
