#!/usr/bin/env bash
script=$(basename "$0")
echo "$script: Starting."
"$(dirname "$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)")/devspace/setup/set-env-vars.sh"
# https://argo-cd.readthedocs.io/en/stable/getting_started
namespace=$(kubectl get namespace "$KINDEST_ARGO_CD_ARGO_NAMESPACE" | grep "$KINDEST_ARGO_CD_ARGO_NAMESPACE")
if [ -n "$namespace" ]; then
  echo "$KINDEST_ARGO_CD_ARGO_NAMESPACE already exists"
else
  kubectl create namespace "$KINDEST_ARGO_CD_ARGO_NAMESPACE"
  kubectl apply -n "$KINDEST_ARGO_CD_ARGO_NAMESPACE" -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  # https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
  "$SCRIPTS_ROOT/k8s/create-cert-secret.sh" "$KINDEST_ARGO_CD_ARGO_NAME-server-tls"
  "$SCRIPTS_ROOT/k8s/create-cert-secret.sh" "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls"
  "$SCRIPTS_ROOT/k8s/create-cert-secret.sh" "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls"
  # https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
  # https://www.pcbaecker.com/posts/setup-argocd/
  # https://medium.com/devopsturkiye/self-managed-argo-cd-app-of-everything-a226eb100cf0
  # https://argo-cd.readthedocs.io/en/stable/getting_started/
  # https://howchoo.com/kubernetes/read-kubernetes-secrets
  kubectl config set-context --current --namespace="$KINDEST_ARGO_CD_ARGO_NAMESPACE"
  #helm upgrade --wait --install "$KINDEST_ARGO_CD_ARGO_NAME" "./src/$KINDEST_ARGO_CD_ARGO_NAME/" --create-namespace
  "$SCRIPTS_ROOT/argocd/login.sh"
fi
# Make sure to kill the port forward when the script exits or it will be orphaned in the on-start.sh script
pkill kubectl -9
echo "$script: Finished."
