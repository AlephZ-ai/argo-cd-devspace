#!/usr/bin/env bash
secret=argocd-initial-admin-secret
echo "Waiting for argo password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 10; done
