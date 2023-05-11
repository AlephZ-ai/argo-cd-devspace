#!/usr/bin/env bash
# https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/
namespace=argocd
secret=$namespace-initial-admin-secret
kubectl config set-context --current --namespace=$namespace
echo "Waiting for $namespace password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 3; done
defaultpassword=password
currentpassword=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
./src/scripts/argo/forward-ports.sh
if [ "$currentpassword" == "$defaultpassword" ]; then
  echo "Password already set to $defaultpassword"
  exit 0
fi
./src/scripts/argo/login.sh
argocd account update-password --current-password "$currentpassword" --new-password $defaultpassword
encodedpassword=$(echo $defaultpassword | base64)
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
./src/scripts/argo/login.sh
