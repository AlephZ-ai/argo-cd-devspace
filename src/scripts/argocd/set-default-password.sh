#!/usr/bin/env zsh
#shellcheck shell=bash
secret="$KINDEST_ARGO_CD_ARGO_NAME-initial-admin-secret"
# https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/wait-for-password.sh"
currentpassword=$(kubectl get secret "$secret" -o jsonpath="{.data.password}" | base64 --decode)
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/login.sh"
if [ "$currentpassword" != "$KINDEST_ARGO_CD_ARGO_PASSWORD" ]; then
  argocd account update-password --current-password "$currentpassword" --new-password "$KINDEST_ARGO_CD_ARGO_PASSWORD"
  encodedpassword=$(echo "$KINDEST_ARGO_CD_ARGO_PASSWORD" | base64)
cat <<EOF | kubectl apply -f -
apiVersion: v1
data:
  password: $encodedpassword
kind: Secret
metadata:
  name: $secret
  namespace: $KINDEST_ARGO_CD_ARGO_NAMESPACE
type: Opaque
EOF
fi
"$KINDEST_ARGO_CD_SCRIPTS_ROOT/argocd/login.sh"
