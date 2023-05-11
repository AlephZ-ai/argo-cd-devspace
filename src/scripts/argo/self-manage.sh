#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
namespace="argocd"
kubectl config set-context --current --namespace=$namespace
./src/scripts/argo/set-default-password.sh
./src/scripts/argo/login.sh
# https://docs.github.com/en/codespaces/developing-in-codespaces/using-github-codespaces-with-github-cli#ssh-into-a-codespace
# https://github.com/argoproj/argo-cd/blob/master/docs/user-guide/private-repositories.md
if [ -z "$GITHUB_TOKEN" ]
then
    echo "FAILURE: $GITHUB_TOKEN is not set. Cannot add git repo to argo." 1>&2
    exit 1
fi
argocd repo add https://github.com/AlephZ-ai/kindest-argo-cd.git --username token --password "$GITHUB_TOKEN"
argocd app create $namespace --repo https://github.com/AlephZ-ai/kindest-argo-cd.git --path src/$namespace --dest-server https://kubernetes.default.svc --dest-namespace $namespace --directory-recursegit a
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
# keep port forwards alive don't shut down after the process ends.
sleep infinity
