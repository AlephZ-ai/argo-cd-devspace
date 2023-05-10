#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
./src/scripts/set-default-argo-password.sh
echo "Setup Complete Ctrl+Shift+~ to open a terminal"
echo "Press Ctrl+Shift+~ to open a terminal"
# keep port forwards alive don't shut down after the process ends.
sleep infinity
