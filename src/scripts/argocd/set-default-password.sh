#!/usr/bin/env bash
script=$0
secret="$KINDEST_ARGO_CD_ARGO_NAME-initial-admin-secret"
echo "$script: Starting."
# https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/
./src/scripts/argocd/wait-for-argo-password.sh
currentpassword=$(kubectl get secret "$secret" -o jsonpath="{.data.password}" | base64 --decode)
./src/scripts/argocd/login.sh
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
./src/scripts/argocd/login.sh
echo "$script: Finished."
