#!/usr/bin/env bash
#shellcheck disable=SC2016
returnCode=0
token=$("gh auth token")
# Make sure this script is idempotent since it will be run multiple times
# https://code.visualstudio.com/remote/advancedcontainers/start-processes
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/set-default-password.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/login.sh"
# https://docs.github.com/en/codespaces/developing-in-codespaces/using-github-codespaces-with-github-cli#ssh-into-a-codespace
# https://github.com/argoproj/argo-cd/blob/master/docs/user-guide/private-repositories.md
# https://docs.github.com/en/enterprise-cloud@latest/codespaces/developing-in-codespaces/default-environment-variables-for-your-codespace
if [ -z "$token" ]; then
    echo 'FAILURE: $GITHUB_TOKEN is not set. Cannot add git repo to argo.' 1>&2
    returnCode=1
else
    argocd repo add "$KINDEST_ARGO_CD_REPO_URL" --username token --password "$token"
    argocd app create "$KINDEST_ARGO_CD_ARGO_NAME" --upsert --validate \
        --release-name "$KINDEST_ARGO_CD_ARGO_NAMES" --app-namespace "$KINDEST_ARGO_CD_ARGO_NAMESPACE" \
        --project "$KINDEST_ARGO_CD_ARGO_PROJECT" --repo "$KINDEST_ARGO_CD_REPO_URL" --set-finalizer --self-heal \
        --auto-prune --sync-policy automated --sync-option CreateNamespace=true --sync-option ServerSideApply=true \
        --path "src/$KINDEST_ARGO_CD_ARGO_NAME" --dest-server https://kubernetes.default.svc --dest-namespace "$KINDEST_ARGO_CD_ARGO_NAMESPACE"
    argocd proj create "$KINDEST_ARGO_CD_ARGO_PROJECT" --upsert --orphaned-resources --orphaned-resources-warn
fi
exit $returnCode
