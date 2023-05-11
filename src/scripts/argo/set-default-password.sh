#!/usr/bin/env bash
# https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/
secret="$ARGONAME-initial-admin-secret"
./src/scripts/argo/wait-for-argo-password.sh
currentpassword=$(kubectl get secret "$secret" -o jsonpath="{.data.password}" | base64 --decode)
./src/scripts/argo/login.sh
if [ "$currentpassword" == "$ARGOPASSWORD" ]; then
  echo "Password already set to $ARGOPASSWORD"
  exit 0
fi
argocd account update-password --current-password "$currentpassword" --new-password "$ARGOPASSWORD"
encodedpassword=$(echo "$ARGOPASSWORD" | base64)
cat <<EOF | kubectl apply -f -
apiVersion: v1
data:
  password: $encodedpassword
kind: Secret
metadata:
  name: $secret
  namespace: $ARGONAMESPACE
type: Opaque
EOF
./src/scripts/argo/login.sh
