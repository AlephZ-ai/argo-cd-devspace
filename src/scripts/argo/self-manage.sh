#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
namespace="argocd"
repo=https://github.com/AlephZ-ai/kindest-argo-cd.git
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
argocd repo add $repo --username token --password "$GITHUB_TOKEN"
argocd proj add-source default $repo
argocd app create $namespace --repo $repo --path src/$namespace --dest-server https://kubernetes.default.svc --dest-namespace $namespace
pkill kubectl -9
