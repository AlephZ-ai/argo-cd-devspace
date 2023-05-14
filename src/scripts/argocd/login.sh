#!/usr/bin/env bash
i="$0"
secret=argocd-initial-admin-secret
echo "$i: Started logging into Argo CD."
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/wait-for-password.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/wait-for-server.sh"
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/forward-port.sh" &
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
echo "$i: Am attempting Argo CD Login..."
while ! (argocd login --insecure localhost:"$KINDEST_ARGO_CD_ARGO_PORT" --username admin --password "$password"); do echo "Retrying Argo CD Login"; sleep 1s; done
echo "Argo CD Login Successful."
echo "$i: Finished logging into Argo CD."
