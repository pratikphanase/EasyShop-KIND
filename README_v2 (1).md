# 🛒 EasyShop-KIND

> **Production-Ready DevOps Portfolio Project** demonstrating Docker,
> Kubernetes (Kind), Helm, GitHub Actions, Jenkins, ArgoCD, MongoDB,
> Prometheus, Grafana, Loki and GitOps.

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-0F1689?logo=helm) ![GitHub
Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?logo=jenkins)
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?logo=prometheus)
![Grafana](https://img.shields.io/badge/Grafana-F46800?logo=grafana)

------------------------------------------------------------------------

# 📖 Overview

EasyShop-KIND simulates how a modern SaaS application is delivered in
production using DevOps best practices.

The repository demonstrates:

-   Docker containerization
-   Kubernetes deployments
-   Kind local cluster
-   Helm packaging
-   GitHub Actions CI/CD
-   Jenkins enterprise pipeline
-   ArgoCD GitOps
-   MongoDB StatefulSet
-   Prometheus & Grafana
-   Loki & Promtail
-   Horizontal Pod Autoscaler
-   Kubernetes Secrets & ConfigMaps
-   Ingress NGINX

------------------------------------------------------------------------

# 🎯 Learning Objectives

By completing this project you will understand:

-   Docker image lifecycle
-   Kubernetes architecture
-   Deployments vs StatefulSets
-   Persistent Volumes
-   ConfigMaps & Secrets
-   Services & Ingress
-   Helm Charts
-   GitHub Actions
-   Jenkins
-   GitOps using ArgoCD
-   Monitoring & Logging
-   Autoscaling

------------------------------------------------------------------------

# 🏗 Architecture

``` text
Developer
    │
    ▼
GitHub Repository
    │
    ├──────────────┐
    ▼              ▼
GitHub Actions   Jenkins
    │              │
    └──────┬───────┘
           ▼
Docker Build
           ▼
Docker Hub
           ▼
ArgoCD
           ▼
Kind Kubernetes Cluster
           │
 ┌─────────┼───────────┐
 ▼         ▼           ▼
Frontend  MongoDB    Ingress
           │
           ▼
      Persistent Volume

Monitoring
Prometheus → Grafana

Logging
Promtail → Loki
```

# 📁 Repository Layout

``` text
EasyShop-KIND/
├── .github/workflows/
├── argocd/
├── docs/
├── helm/easyshop/
├── kubernetes/
├── monitoring/
├── scripts/
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
└── README.md
```

# ⚙️ Prerequisites

  Tool      Version
  --------- ---------
  Docker    Latest
  Kind      v0.27+
  kubectl   Latest
  Helm      v3+
  Git       Latest

# 🚀 Quick Start

## Clone

``` bash
git clone https://github.com/pratikphanase/EasyShop-KIND.git
cd EasyShop-KIND
```

## Create Cluster

``` bash
kind create cluster --name easyshop --config kubernetes/00-kind-config.yaml
```

## Deploy

``` bash
kubectl apply -f kubernetes/
```

Or with Helm:

``` bash
helm install easyshop helm/easyshop
```

# 🔄 CI/CD Flow

1.  Developer pushes code.
2.  GitHub Actions builds and validates the application.
3.  Docker image is built and pushed.
4.  Jenkins can execute enterprise deployment stages (SonarQube, Trivy,
    Helm).
5.  ArgoCD synchronizes Kubernetes from Git.
6.  Kubernetes performs a rolling update.

# 📊 Monitoring

-   Prometheus collects metrics.
-   Grafana visualizes dashboards.
-   Loki stores logs.
-   Promtail ships logs.

# 🔐 Security

-   Kubernetes Secrets
-   Non-root containers (recommended)
-   Resource requests and limits
-   Readiness/Liveness probes
-   Image scanning with Trivy
-   SonarQube quality gates

# ✅ Verification

``` bash
kubectl get nodes
kubectl get pods -A
kubectl get svc -A
kubectl get ingress -A
kubectl top pods -A
```

# 🛠 Troubleshooting

``` bash
kubectl describe pod <pod> -n easyshop
kubectl logs <pod> -n easyshop
kubectl rollout status deployment/easyshop -n easyshop
```

# 🧹 Cleanup

``` bash
helm uninstall easyshop
kind delete cluster --name easyshop
docker system prune -f
```

# 📈 Future Roadmap

-   Multi-environment (dev/stage/prod)
-   External Secrets Operator
-   Terraform provisioning
-   AWS EKS deployment
-   Karpenter
-   Blue/Green deployments
-   Canary deployments
-   Velero backups
-   Service Mesh (Istio)

# 💼 Interview Topics Covered

-   Docker
-   Kubernetes
-   Helm
-   StatefulSets
-   Persistent Volumes
-   CI/CD
-   GitOps
-   Monitoring
-   Logging
-   Autoscaling
-   Ingress
-   Secrets
-   ConfigMaps

# 📄 License

MIT
