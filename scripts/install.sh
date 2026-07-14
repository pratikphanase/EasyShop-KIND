#!/bin/bash

set -e

echo "===================================="
echo " Installing EasyShop Platform"
echo "===================================="

echo "Checking Docker..."

if ! command -v docker &> /dev/null
then
    echo "Docker not installed."
    exit 1
fi

echo "Checking Kind..."

if ! command -v kind &> /dev/null
then
    echo "Kind not installed."
    exit 1
fi

echo "Checking kubectl..."

if ! command -v kubectl &> /dev/null
then
    echo "kubectl not installed."
    exit 1
fi

echo "Checking Helm..."

if ! command -v helm &> /dev/null
then
    echo "Helm not installed."
    exit 1
fi

echo ""
echo "Creating Kind Cluster..."

kind create cluster \
--name easyshop \
--config kubernetes/00-kind-config.yaml || true

echo ""
echo "Installing NGINX Ingress..."

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo ""

kubectl wait \
--namespace ingress-nginx \
--for=condition=ready pod \
--selector=app.kubernetes.io/component=controller \
--timeout=180s

echo ""

echo "Installing Metrics Server..."

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo ""

echo "Platform Ready."
