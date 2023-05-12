#!/usr/bin/env bash
echo "argocd/wait-for-argo-password.sh: Starting."
secret=argocd-initial-admin-secret
echo "Waiting for argo password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 10; done
echo "argocd/wait-for-argo-password.sh: Finished."
