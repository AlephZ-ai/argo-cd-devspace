#!/usr/bin/env bash
# https://argo-cd.readthedocs.io/en/stable/getting_started
exists=$(kubectl get namespace "$ARGONAMESPACE" | grep "$ARGONAMESPACE")
if [ -n "$exists" ]; then
  echo "$ARGONAMESPACE already exists"
  exit 0
fi
kubectl create namespace "$ARGONAMESPACE"
kubectl apply -n "$ARGONAMESPACE" -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
./src/scripts/k8s/apply-cert-secret.sh "$ARGONAME-server-tls"
./src/scripts/k8s/apply-cert-secret.sh "$ARGONAME-repo-server-tls"
./src/scripts/k8s/apply-cert-secret.sh "$ARGONAME-dex-server-tls"
# https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/
# https://www.pcbaecker.com/posts/setup-argocd/
# https://medium.com/devopsturkiye/self-managed-argo-cd-app-of-everything-a226eb100cf0
# https://argo-cd.readthedocs.io/en/stable/getting_started/
# https://howchoo.com/kubernetes/read-kubernetes-secrets
kubectl config set-context --current --namespace="$ARGONAMESPACE"
helm upgrade --wait --install "$ARGONAME" "./src/$ARGONAME/" --create-namespace
./src/scripts/argo/login.sh
