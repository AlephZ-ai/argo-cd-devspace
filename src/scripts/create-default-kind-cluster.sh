#!/usr/bin/env bash
# https://kind.sigs.k8s.io/docs/user/quick-start/
# https://cloud.google.com/anthos/clusters/docs/on-prem/latest/troubleshoot-user-cluster-create-api
# https://itnext.io/kubernetes-kind-cheat-shee-2605da77984
# existingCluster=$(kind get cluster default)
kind create cluster --wait 30s --config src/clusters/default.yaml
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/kubectl/
kubectl config use-context kind-default
kubectl version --short
kubectl cluster-info
