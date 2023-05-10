#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
$argo="argocd"
./src/scripts/set-default-argo-password.sh
argocd cert add-tls $namespace.local --from ./devcerts/root/cert.crt
# How to get code spaces?
argocd repo add git@github.com:AlephZ-ai/kindest-argo-cd.git --ssh-private-key-path ~/.ssh/id_rsa
argocd app create $argo --repo git@github.com:AlephZ-ai/argo-cd-devspace.git --path src/$argo --dest-server https://kubernetes.default.svc --dest-namespace $argo --directory-recursegit a
echo "Setup Complete Ctrl+Shift+~ to open a terminal"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
sleep infinity
