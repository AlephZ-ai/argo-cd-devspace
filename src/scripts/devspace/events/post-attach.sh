#!/usr/bin/env bash
script=$0
echo "$script: Starting."
./src/scripts/argocd/forward-port-continuously.sh
./src/scripts/argocd/login.sh
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
echo "$script: Sleeping Infinitly."
sleep infinity
