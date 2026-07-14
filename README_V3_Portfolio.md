# 🛒 EasyShop-KIND

> **Enterprise DevOps Portfolio Project** demonstrating a complete
> software delivery lifecycle using Docker, Kubernetes (Kind), Helm,
> GitHub Actions, Jenkins, ArgoCD, Prometheus, Grafana, Loki and
> MongoDB.

------------------------------------------------------------------------

# 📌 Table of Contents

1.  Project Overview
2.  Business Problem
3.  Solution Architecture
4.  Technology Stack
5.  Repository Structure
6.  Architecture Diagram
7.  Deployment Flow
8.  Prerequisites
9.  Installation
10. Docker Workflow
11. Kind Cluster Setup
12. Kubernetes Deployment
13. Helm Deployment
14. GitHub Actions Pipeline
15. Jenkins Pipeline
16. ArgoCD GitOps
17. Monitoring Stack
18. Logging Stack
19. Scaling (HPA)
20. Security Best Practices
21. Verification
22. Troubleshooting
23. Interview Questions
24. Future Improvements
25. License

------------------------------------------------------------------------

# 1. Project Overview

EasyShop-KIND is a production-style learning project designed to
simulate how an e-commerce application is built, containerized, tested,
deployed, monitored, and managed in Kubernetes.

The objective is to provide hands-on experience with modern DevOps
practices rather than simply deploying an application.

------------------------------------------------------------------------

# 2. Business Problem

Development teams need a repeatable deployment process that provides:

-   Fast deployments
-   Zero-downtime updates
-   Infrastructure consistency
-   Monitoring
-   Centralized logging
-   Rollback capability
-   GitOps automation

This repository demonstrates one approach using open-source tooling.

------------------------------------------------------------------------

# 3. Technology Stack

  Layer             Technology
  ----------------- -----------------
  Frontend          Next.js
  Runtime           Node.js
  Database          MongoDB
  Containers        Docker
  Orchestration     Kubernetes
  Local Cluster     Kind
  Package Manager   Helm
  GitOps            ArgoCD
  CI                GitHub Actions
  CD                Jenkins / Helm
  Metrics           Prometheus
  Dashboard         Grafana
  Logs              Loki + Promtail

------------------------------------------------------------------------

# 4. Repository Structure

``` text
EasyShop-KIND
├── .github/workflows
├── argocd
├── docs
├── helm/easyshop
├── kubernetes
├── monitoring
├── scripts
├── src
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
└── README.md
```

------------------------------------------------------------------------

# 5. Architecture

``` text
Developer
    │
    ▼
GitHub
    │
    ├────────────┐
    ▼            ▼
GitHub Actions Jenkins
      │
      ▼
Docker Image
      ▼
Docker Hub
      ▼
ArgoCD
      ▼
Kind Cluster
 ├───────────────┐
 │               │
 ▼               ▼
EasyShop      MongoDB
 │               │
 └──────┬────────┘
        ▼
     Service
        ▼
   NGINX Ingress
        ▼
      Browser

Metrics:
Prometheus → Grafana

Logs:
Promtail → Loki
```

------------------------------------------------------------------------

# 6. Deployment Guide

## Clone

``` bash
git clone https://github.com/pratikphanase/EasyShop-KIND.git
cd EasyShop-KIND
```

## Create Kind Cluster

``` bash
kind create cluster --name easyshop --config kubernetes/00-kind-config.yaml
```

## Deploy Namespace

``` bash
kubectl apply -f kubernetes/01-namespace.yaml
```

## Deploy Storage

``` bash
kubectl apply -f kubernetes/02-mongodb-pv.yaml
kubectl apply -f kubernetes/03-mongodb-pvc.yaml
```

## Deploy Configuration

``` bash
kubectl apply -f kubernetes/04-configmap.yaml
kubectl apply -f kubernetes/05-secrets.yaml
```

## Deploy MongoDB

``` bash
kubectl apply -f kubernetes/06-mongodb-service.yaml
kubectl apply -f kubernetes/07-mongodb-statefulset.yaml
```

## Deploy Application

``` bash
kubectl apply -f kubernetes/08-easyshop-deployment.yaml
kubectl apply -f kubernetes/09-easyshop-service.yaml
kubectl apply -f kubernetes/10-ingress.yaml
kubectl apply -f kubernetes/11-hpa.yaml
kubectl apply -f kubernetes/12-migration-job.yaml
```

------------------------------------------------------------------------

# 7. Helm Deployment

``` bash
helm lint helm/easyshop
helm install easyshop helm/easyshop
helm upgrade easyshop helm/easyshop
```

------------------------------------------------------------------------

# 8. GitHub Actions

Pipeline stages:

-   Checkout
-   Install dependencies
-   Lint
-   Build
-   Docker Build
-   Docker Push
-   Helm Deploy

------------------------------------------------------------------------

# 9. Jenkins

Pipeline stages:

-   Checkout
-   Build
-   Unit Test
-   SonarQube
-   Trivy
-   Docker Build
-   Docker Push
-   Helm Upgrade
-   Rollback on failure

------------------------------------------------------------------------

# 10. ArgoCD

Repository becomes the source of truth.

``` text
Git Commit
   ↓
ArgoCD detects change
   ↓
Sync
   ↓
Kubernetes updated
```

------------------------------------------------------------------------

# 11. Monitoring

-   Prometheus collects metrics.
-   Grafana visualizes dashboards.
-   HPA uses metrics-server for scaling.

------------------------------------------------------------------------

# 12. Logging

-   Promtail collects logs.
-   Loki stores logs.
-   Grafana queries Loki.

------------------------------------------------------------------------

# 13. Security

-   Kubernetes Secrets
-   ConfigMaps
-   Readiness/Liveness probes
-   Resource limits
-   Image scanning (Trivy)
-   Code scanning (SonarQube)

------------------------------------------------------------------------

# 14. Verification

``` bash
kubectl get nodes
kubectl get pods -A
kubectl get svc -A
kubectl get ingress -A
kubectl top pods -A
```

------------------------------------------------------------------------

# 15. Troubleshooting

``` bash
kubectl describe pod <pod> -n easyshop
kubectl logs <pod> -n easyshop
kubectl rollout status deployment/easyshop -n easyshop
```

------------------------------------------------------------------------

# 16. Interview Questions This Project Helps Answer

-   Explain Kubernetes architecture.
-   Deployment vs StatefulSet.
-   ConfigMap vs Secret.
-   HPA workflow.
-   Helm vs kubectl.
-   GitOps.
-   Rolling updates.
-   Blue/Green vs Canary.
-   CI/CD pipeline design.
-   Monitoring strategy.

------------------------------------------------------------------------

# 17. Future Roadmap

-   AWS EKS version
-   Terraform provisioning
-   Multi-environment values
-   External Secrets
-   Velero backup
-   Istio service mesh
-   Karpenter
-   Canary deployments

------------------------------------------------------------------------

# License

MIT
