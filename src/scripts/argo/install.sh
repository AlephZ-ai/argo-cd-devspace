#!/usr/bin/env bash
# https://argo-cd.readthedocs.io/en/stable/getting_started
exists=$(kubectl get namespace "$KINDEST_ARGO_CD_ARGO_NAMESPACE" | grep "$KINDEST_ARGO_CD_ARGO_NAMESPACE")
if [ -n "$exists" ]; then
  echo "$KINDEST_ARGO_CD_ARGO_NAMESPACE already exists"
  exit 0
fi
kubectl create namespace "$KINDEST_ARGO_CD_ARGO_NAMESPACE"
kubectl apply -n "$KINDEST_ARGO_CD_ARGO_NAMESPACE" -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
./src/scripts/k8s/apply-cert-secret.sh "$KINDEST_ARGO_CD_ARGO_NAME-server-tls"
./src/scripts/k8s/apply-cert-secret.sh "$KINDEST_ARGO_CD_ARGO_NAME-repo-server-tls"
./src/scripts/k8s/apply-cert-secret.sh "$KINDEST_ARGO_CD_ARGO_NAME-dex-server-tls"
# https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
# https://www.pcbaecker.com/posts/setup-argocd/
# https://medium.com/devopsturkiye/self-managed-argo-cd-app-of-everything-a226eb100cf0
# https://argo-cd.readthedocs.io/en/stable/getting_started/
# https://howchoo.com/kubernetes/read-kubernetes-secrets
kubectl config set-context --current --namespace="$KINDEST_ARGO_CD_ARGO_NAMESPACE"
helm upgrade --wait --install "$KINDEST_ARGO_CD_ARGO_NAME" "./src/$KINDEST_ARGO_CD_ARGO_NAME/" --create-namespace
./src/scripts/argo/login.sh
