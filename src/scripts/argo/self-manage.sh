#!/usr/bin/env bash
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
./src/scripts/argo/set-default-password.sh
./src/scripts/argo/login.sh
# https://docs.github.com/en/codespaces/developing-in-codespaces/using-github-codespaces-with-github-cli#ssh-into-a-codespace
# https://github.com/argoproj/argo-cd/blob/master/docs/user-guide/private-repositories.md
if [ -z "$ARGO_GITHUB_TOKEN" ]
then
    echo "FAILURE: $ARGO_GITHUB_TOKEN is not set. Cannot add git repo to argo." 1>&2
    exit 1
fi
argocd repo add "$REPO_URL" --username token --password "$ARGO_GITHUB_TOKEN"
#argocd proj create $project --upsert --orphaned-resources --orphaned-resources-warn -source-namespaces $namespace -src "$repo" --dest "https://kubernetes.default.svc,$namespace"
argocd app create "$ARGO_NAME" --upsert --validate --release-name "$ARGO_NAMES" --app-namespace "$ARGO_NAMESPACE" --project "$ARGO_PROJECT" --repo "$REPO_URL" --set-finalizer --self-heal --auto-prune --sync-policy automated --sync-option CreateNamespace=true --sync-option ServerSideApply=true --path "src/$ARGO_NAME" --dest-server https://kubernetes.default.svc --dest-namespace "$ARGO_NAMESPACE"
pkill kubectl -9
