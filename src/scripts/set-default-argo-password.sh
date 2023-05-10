#!/usr/bin/env bash
namespace=argocd
secret=$namespace-initial-admin-secret
echo "Waiting for $namespace password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 3; done
./src/scripts/argo-login.sh
defaultpassword=password
currentpassword=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd account update-password --current-password $currentpassword --new-password $defaultpassword
$encodedpassword=$(echo -n $defaultpassword | base64)
cat <<EOF | kubectl apply -f -
apiVersion: v1
data:
  password: $encodedpassword
kind: Secret
metadata:
  name: $secret
  namespace: $namespace
type: Opaque
EOF
./src/scripts/argo-login.sh
