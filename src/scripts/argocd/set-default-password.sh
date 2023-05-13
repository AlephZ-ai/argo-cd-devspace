#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")")/devspace/setup/set-env-vars.sh"
secret="$KINDEST_ARGO_CD_ARGO_NAME-initial-admin-secret"
# https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/
"$SCRIPTS_ROOT/argocd/wait-for-argo-password.sh"
currentpassword=$(kubectl get secret "$secret" -o jsonpath="{.data.password}" | base64 --decode)
"$SCRIPTS_ROOT/argocd/login.sh"
if [ "$currentpassword" == "$KINDEST_ARGO_CD_ARGO_PASSWORD" ]; then
  echo "Password already set to $KINDEST_ARGO_CD_ARGO_PASSWORD"
  exit 0
fi
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
"$SCRIPTS_ROOT/argocd/login.sh"
echo "$script: Finished."
