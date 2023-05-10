#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
$argo="argocd"
./src/scripts/set-default-argo-password.sh
argocd app create $argo --repo git@github.com:AlephZ-ai/argo-cd-devspace.git --path src/$argo --dest-server https://kubernetes.default.svc --dest-namespace $argo --directory-recurse
echo "Setup Complete Ctrl+Shift+~ to open a terminal"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
sleep infinity
