#!/usr/bin/env bash
secret=argocd-initial-admin-secret
echo "Waiting for argo password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 3; done
argo-login.sh
defaultpassword=password
currentpassword=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd account update-password --current-password $currentpassword --new-password $defaultpassword
$encodedpassword=$(echo -n $argopassword | base64)
cat <<EOF | kubectl apply -f -
apiVersion: v1
data:
  password: $encodedpassword
kind: Secret
metadata:
  creationTimestamp: "2023-05-10T02:48:06Z"
  name: argocd-initial-admin-secret
  namespace: argocd
  resourceVersion: "1078"
  uid: 9a796a3e-fc4d-4251-891f-242f1c023fa9
type: Opaque
EOF
argo-login.sh
