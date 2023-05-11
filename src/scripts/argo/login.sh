#!/usr/bin/env bash
secret=argocd-initial-admin-secret
./src/scripts/argo/wait-for-argo-password.sh
./src/scripts/argo/wait-for-argo-server.sh
./src/scripts/argo/forward-ports.sh
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd login --insecure localhost:"$ARGOPORT" --username admin --password "$password"
