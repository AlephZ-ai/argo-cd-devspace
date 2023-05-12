#!/usr/bin/env bash
echo "argocd/login.sh: Starting."
secret=argocd-initial-admin-secret
./src/scripts/argocd/wait-for-password.sh
./src/scripts/argocd/wait-for-server.sh
./src/scripts/argocd/forward-ports-continuously.sh
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd login --insecure localhost:"$KINDEST_ARGO_CD_ARGO_PORT" --username admin --password "$password"
echo "argocd/login.sh: Finished."
