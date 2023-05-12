#!/usr/bin/env bash
script=$0
secret=argocd-initial-admin-secret
echo "$script: Starting."
./src/scripts/argocd/wait-for-password.sh
./src/scripts/argocd/wait-for-server.sh
./src/scripts/argocd/forward-ports.sh &
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd login --insecure localhost:"$KINDEST_ARGO_CD_ARGO_PORT" --username admin --password "$password"
echo "$script: Finished."
