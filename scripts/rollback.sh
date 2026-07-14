#!/bin/bash

echo "Rolling Back..."

helm rollback easyshop

kubectl rollout status deployment/easyshop \
-n easyshop

kubectl get pods -n easyshop

echo ""

echo "Rollback Successful."
