#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
namespace="argocd"
repo=https://github.com/AlephZ-ai/kindest-argo-cd.git
project=default
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
argocd proj create $project --upsert --orphaned-resources --orphaned-resources-warn -source-namespaces $namespace -src "$repo" --dest "https://kubernetes.default.svc,$namespace"
argocd app create $namespace --upsert --validate --release-name $namespace --app-namespace $namespace --project $project --repo "$repo" --set-finalizer --self-heal --auto-prune --sync-policy automated --sync-option CreateNamespace=true --sync-option ServerSideApply=true --path src/$namespace --dest-server https://kubernetes.default.svc --dest-namespace $namespace
pkill kubectl -9
