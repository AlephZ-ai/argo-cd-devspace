#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
$argo="argocd"
./src/scripts/set-default-argo-password.sh
argocd cert add-tls $namespace.local --from ./devcerts/root/cert.crt
# https://docs.github.com/en/codespaces/developing-in-codespaces/using-github-codespaces-with-github-cli#ssh-into-a-codespace
# https://github.com/argoproj/argo-cd/blob/master/docs/user-guide/private-repositories.md
argocd repo add https://github.com/AlephZ-ai/kindest-argo-cd.git --username token --password $GITHUB_TOKEN
argocd app create $argo --repo https://github.com/AlephZ-ai/kindest-argo-cd.git --path src/$argo --dest-server https://kubernetes.default.svc --dest-namespace $argo --directory-recursegit a
echo "Setup Complete Ctrl+Shift+~ to open a terminal"
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
sleep infinity
