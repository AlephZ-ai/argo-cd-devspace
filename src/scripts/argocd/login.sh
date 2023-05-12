#!/usr/bin/env bash
script=$0
secret=argocd-initial-admin-secret
echo "$script: Starting."
./src/scripts/argocd/wait-for-password.sh
./src/scripts/argocd/wait-for-server.sh
./src/scripts/argocd/forward-port.sh &
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
echo "Attempting Argo CD Login..."
while ! (argocd login --insecure localhost:"$KINDEST_ARGO_CD_ARGO_PORT" --username admin --password "$password"); do echo "Retrying Argo CD Login"; sleep 1s; done
echo "Argo CD Login Successful."
echo "$script: Finished."
