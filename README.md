# EasyShop-KIND
# EasyShop-KIND

A Production-Ready DevOps project demonstrating deployment of a cloud-native e-commerce application on Kubernetes using Kind.

## Tech Stack

- Docker
- Kubernetes
- Kind
- MongoDB
- NGINX Ingress
- GitHub Actions
- Jenkins
- Helm
- ArgoCD
- Prometheus
- Grafana
- Loki
- Promtail

---

## Architecture

Developer
↓
GitHub
↓
GitHub Actions
↓
Docker Hub
↓
ArgoCD
↓
Kind Cluster
↓
EasyShop + MongoDB
↓
NGINX Ingress

Monitoring

Prometheus
Grafana
Loki
Promtail

---

## Features

- Kubernetes Deployment
- StatefulSet
- Persistent Volumes
- HPA
- Ingress
- ConfigMaps
- Secrets
- CI/CD
- GitOps
- Monitoring
- Logging

---

Workflow Status Badges

Add these to your README later:

![CI](https://github.com/pratikphanase/EasyShop-KIND/actions/workflows/ci.yml/badge.svg)

![CD](https://github.com/pratikphanase/EasyShop-KIND/actions/workflows/cd.yml/badge.svg)





___________________________________________________________________________________________________________________________________________________________________________

# 🛒 EasyShop-KIND

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?logo=kubernetes&logoColor=white)

![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)

![Helm](https://img.shields.io/badge/Helm-0F1689?logo=helm&logoColor=white)

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions&logoColor=white)

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?logo=jenkins&logoColor=white)

![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?logo=argo&logoColor=white)

![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?logo=prometheus&logoColor=white)

![Grafana](https://img.shields.io/badge/Grafana-F46800?logo=grafana&logoColor=white)

![Loki](https://img.shields.io/badge/Loki-000000)

---

# 📖 Project Overview

EasyShop-KIND is a production-style DevOps project that demonstrates how to deploy a cloud-native e-commerce application on a Kubernetes cluster running on **Kind (Kubernetes IN Docker)**.

The repository showcases modern DevOps practices including:

- Docker Containerization
- Kubernetes
- Helm
- GitHub Actions
- Jenkins
- ArgoCD GitOps
- MongoDB StatefulSet
- Horizontal Pod Autoscaler
- Prometheus
- Grafana
- Loki
- CI/CD Automation

This project is intended for engineers who want hands-on experience with Kubernetes deployments, GitOps workflows, Infrastructure as Code concepts, CI/CD pipelines, and production-ready deployment practices.

---

# 🎯 Project Objectives

This repository demonstrates:

- Docker Image Creation
- Kubernetes Deployments
- MongoDB StatefulSet
- Persistent Volumes
- ConfigMaps
- Secrets
- Ingress Controller
- Helm Packaging
- GitHub Actions CI/CD
- Jenkins Pipeline
- GitOps using ArgoCD
- Monitoring
- Logging
- Autoscaling
- Production Deployment Strategy

---

# 🚀 Architecture

```text
                      Developer
                           │
                           ▼
                     GitHub Repository
                           │
               GitHub Actions CI Pipeline
                           │
                           ▼
                  Docker Build & Push
                           │
                           ▼
                     Docker Hub Registry
                           │
                           ▼
                   ArgoCD GitOps Sync
                           │
                           ▼
                  Kind Kubernetes Cluster
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
 EasyShop Deployment   MongoDB StatefulSet   Ingress
        │                  │
        └──────────────┬───┘
                       ▼
                    Service
                       │
                       ▼
                 End Users

Monitoring Stack

Prometheus
     │
     ▼
Grafana

Logs

Promtail
     │
     ▼
Loki
```

---

# ✨ Features

- Production Ready Folder Structure
- Kubernetes Deployment
- Helm Charts
- GitHub Actions CI/CD
- Jenkins Pipeline
- GitOps Deployment
- Monitoring Stack
- Centralized Logging
- Horizontal Pod Autoscaler
- MongoDB StatefulSet
- Persistent Storage
- Secrets Management
- ConfigMaps
- Ingress
- Health Probes
- Rolling Updates
- Rollback Support
- Docker Compose for Local Development
- Enterprise Ready Repository

---

# 🛠 Technology Stack

| Category | Technology |
|-----------|------------|
| Language | TypeScript |
| Framework | Next.js |
| Runtime | Node.js |
| Database | MongoDB |
| Container | Docker |
| Orchestration | Kubernetes |
| Local Cluster | Kind |
| Package Manager | Helm |
| GitOps | ArgoCD |
| CI/CD | GitHub Actions |
| CI/CD | Jenkins |
| Monitoring | Prometheus |
| Dashboard | Grafana |
| Logging | Loki |
| Log Collector | Promtail |

---

# 📁 Repository Structure

```text
EasyShop-KIND
│
├── .github/
│   └── workflows/
│
├── argocd/
│
├── docs/
│
├── helm/
│
├── kubernetes/
│
├── monitoring/
│
├── scripts/
│
├── Dockerfile
├── Dockerfile.dev
├── docker-compose.yml
├── Jenkinsfile
├── README.md
└── src/
```

