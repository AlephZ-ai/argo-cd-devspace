#!/usr/bin/env bash
i="$0"
secret=argocd-initial-admin-secret
echo "$i: Started waiting on initial Argo CD password."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/k8s/wait-for-secret.sh" "$secret"
echo "$i: Finished waiting on initial Argo CD password."
