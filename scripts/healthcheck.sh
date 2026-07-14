#!/bin/bash

echo "================================="
echo "EasyShop Health Report"
echo "================================="

kubectl get nodes

echo ""

kubectl get pods -A

echo ""

kubectl get svc -A

echo ""

kubectl get ingress -A

echo ""

kubectl top nodes || true

echo ""

kubectl top pods -A || true

echo ""

kubectl get pvc

echo ""

kubectl get pv

echo ""

echo "Health Check Finished."
