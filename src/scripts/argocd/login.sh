#!/usr/bin/env bash
script="$(basename "$0")"
scriptPath="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
scriptsPath="$(dirname "$scriptPath")"
script="$scriptPath/$script"
echo "$script: Starting."
"scriptsPath/devspace/setup/set-env-vars.sh"
secret=argocd-initial-admin-secret
"$scriptsPath/argocd/wait-for-password.sh"
"$scriptsPath/argocd/wait-for-server.sh"
"$scriptsPath/argocd/forward-port.sh" &
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
echo "Attempting Argo CD Login..."
while ! (argocd login --insecure localhost:"$KINDEST_ARGO_CD_ARGO_PORT" --username admin --password "$password"); do echo "Retrying Argo CD Login"; sleep 1s; done
echo "Argo CD Login Successful."
echo "$script: Finished."
