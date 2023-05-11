#!/usr/bin/env bash
echo "Forwarding ports"
./src/scripts/argo/forward-ports.sh
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
sleep infinity
