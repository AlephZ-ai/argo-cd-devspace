#!/usr/bin/env bash
script=$0
echo "$script: Starting."
# https://kind.sigs.k8s.io/docs/user/quick-start/
# https://cloud.google.com/anthos/clusters/docs/on-prem/latest/troubleshoot-user-cluster-create-api
# https://itnext.io/kubernetes-kind-cheat-shee-2605da77984
while ! (kind create cluster --wait 30s --config "$PROJECT_ROOT/src/clusters/$KINDEST_ARGO_CD_CLUSTER_NAME.yaml" 2>&1); do kind delete clusters "$KINDEST_ARGO_CD_CLUSTER_NAME"; done
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/kubectl/
kubectl config use-context "kind-$KINDEST_ARGO_CD_CLUSTER_NAME"
kubectl version --short
kubectl cluster-info
echo "$script: Finished."
