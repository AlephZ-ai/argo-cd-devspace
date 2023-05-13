#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
secret=argocd-initial-admin-secret
"$SCRIPTS_ROOT/k8s/wait-for-secret.sh" "$secret"
echo "$script: Finished."
