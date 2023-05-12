#!/usr/bin/env bash
echo "post-attach.sh: Starting."
echo "Loging into argo-cd which will forward ports if needed"
./src/scripts/argocd/login.sh
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
echo "post-attach.sh: Sleep Infinitly."
sleep infinity
