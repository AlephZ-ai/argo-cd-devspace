#!/usr/bin/env bash
i="$0"
timeout=30s
echo "$i: Started creating kindest cluster."
# https://kind.sigs.k8s.io/docs/user/quick-start/
# https://cloud.google.com/anthos/clusters/docs/on-prem/latest/troubleshoot-user-cluster-create-api
# https://itnext.io/kubernetes-kind-cheat-shee-2605da77984
while ! (kind create cluster --wait "$timeout" --config "$KINDEST_ARGO_CD_PROJECT_ROOT/src/clusters/$KINDEST_ARGO_CD_CLUSTER_NAME.yaml"); do kind delete clusters "$KINDEST_ARGO_CD_CLUSTER_NAME"; done
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/kubectl/
kubectl config use-context "kind-$KINDEST_ARGO_CD_CLUSTER_NAME"
kubectl version --short
kubectl cluster-info
echo "$i: Finished creating kindest cluster."
