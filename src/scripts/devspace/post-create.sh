#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
script=$0
echo "$script: Starting."
./src/scripts/argocd/self-manage.sh
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "$script: Finished."
