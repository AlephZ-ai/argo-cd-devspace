#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")")")/devspace/setup/set-env-vars.sh"
"$SCRIPTS_ROOT/argocd/forward-port-continuously.sh"
"$SCRIPTS_ROOT/argocd/login.sh"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
echo "$script: Sleeping Infinitly."
sleep infinity
