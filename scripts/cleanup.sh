#!/bin/bash

echo "Deleting EasyShop..."

kubectl delete namespace easyshop --ignore-not-found

kind delete cluster --name easyshop

docker system prune -f

echo "Cleanup Completed."
