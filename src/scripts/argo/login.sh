#!/usr/bin/env bash
echo "argo/login.sh: Starting."
secret=argocd-initial-admin-secret
./src/scripts/argo/wait-for-password.sh
./src/scripts/argo/wait-for-server.sh
./src/scripts/argo/forward-ports-continuously.sh
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd login --insecure localhost:"$KINDEST_ARGO_CD_ARGO_PORT" --username admin --password "$password"
echo "argo/login.sh: Finished."
