#!/bin/bash

DATE=$(date +%F-%H-%M)

mkdir -p backups

echo "Creating MongoDB Backup..."

kubectl exec -n easyshop mongodb-0 -- \
mongodump \
--archive=/tmp/backup.archive

kubectl cp \
easyshop/mongodb-0:/tmp/backup.archive \
backups/mongodb-$DATE.archive

echo ""

echo "Backup Saved"

ls -lh backups/
