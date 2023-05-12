#!/usr/bin/env bash
script=$0
secret=argocd-initial-admin-secret
echo "$script: Starting."
echo "Waiting for argo password. CTRL-C to exit."
while ! (kubectl get secret $secret 2>&1); do sleep 10; done
echo "$script: Finished."
