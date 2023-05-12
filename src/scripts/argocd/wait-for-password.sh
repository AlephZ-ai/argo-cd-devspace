#!/usr/bin/env bash
script=$0
secret=argocd-initial-admin-secret
echo "$script: Starting."
"$SCRIPTS_ROOT/k8s/wait-for-secret.sh $secret"
echo "$script: Finished."
