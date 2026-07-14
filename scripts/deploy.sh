#!/bin/bash

set -e

echo "Deploying EasyShop..."

kubectl apply -f kubernetes/

echo ""

echo "Waiting for MongoDB..."

kubectl rollout status statefulset/mongodb \
-n easyshop

echo ""

echo "Waiting for EasyShop..."

kubectl rollout status deployment/easyshop \
-n easyshop

echo ""

kubectl get pods -n easyshop

echo ""

kubectl get svc -n easyshop

echo ""

kubectl get ingress -n easyshop

echo ""

echo "Deployment Successful."
