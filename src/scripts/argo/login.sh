#!/usr/bin/env zsh
secret=argocd-initial-admin-secret
echo "Waiting for argo password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 10; done
password=$(kubectl get secret $secret -o jsonpath="{.data.password}" | base64 --decode)
argocd login --insecure localhost:7443 --username admin --password $password
