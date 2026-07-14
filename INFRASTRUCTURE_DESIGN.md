# Infrastructure Design Guide

This document explains the AWS infrastructure required to run the
**EasyShop-KIND** project and the reasoning behind each component.

------------------------------------------------------------------------

# AWS Architecture

``` text
                     Internet
                         │
                         ▼
                 Internet Gateway
                         │
        ┌────────────────┴─────────────────┐
        │                                  │
 Public Subnet-A                     Public Subnet-B
        │
        ▼
+----------------------------------------------------+
| Ubuntu EC2                                         |
|----------------------------------------------------|
| Docker                                              |
| Kind Cluster (1 Control Plane + 2 Workers)          |
| kubectl                                             |
| Helm                                                |
| NGINX Ingress                                       |
| EasyShop                                            |
| MongoDB                                             |
| Prometheus                                          |
| Grafana                                             |
| Loki                                                |
| Jenkins                                             |
+----------------------------------------------------+
```

------------------------------------------------------------------------

# Infrastructure Summary

  Component          Recommendation
  ------------------ ----------------------------------
  VPC                1
  CIDR               10.0.0.0/16
  Public Subnets     2
  Private Subnets    Not required for Kind lab
  Internet Gateway   1
  NAT Gateway        Not required
  Route Table        1 Public Route Table
  Security Group     1
  EC2                1 Ubuntu Server
  IAM Role           Yes
  Elastic IP         Recommended
  Kubernetes         Kind
  Nodes              1 Control Plane + 2 Worker Nodes

------------------------------------------------------------------------

# VPC

-   One VPC is sufficient.
-   CIDR: `10.0.0.0/16`

# Subnets

  Name       CIDR          Availability Zone
  ---------- ------------- -------------------
  Public-A   10.0.1.0/24   ap-south-1a
  Public-B   10.0.2.0/24   ap-south-1b

Reason: - Demonstrates Multi-AZ networking concepts. - Kind still runs
on a single EC2 instance.

# EC2 Instance

Minimum: - t3.large

Recommended: - t3.xlarge

Operating System: - Ubuntu 22.04 LTS

Storage: - 50 GB gp3

Reason: - Docker images - MongoDB data - Prometheus TSDB - Grafana -
Loki logs

consume considerable disk space.

# Security Group

Inbound:

-   22 SSH
-   80 HTTP
-   443 HTTPS
-   3000 Grafana (optional)
-   8080 Jenkins
-   9090 Prometheus
-   3100 Loki

Outbound: - Allow All

# IAM Role

Recommended IAM Role:

`EasyShop-EC2-Role`

Policies:

-   AmazonSSMManagedInstanceCore
-   CloudWatchAgentServerPolicy (optional)
-   AmazonEC2ContainerRegistryReadOnly (if using ECR)
-   S3 permissions for backups (least privilege preferred)

# DNS

Development: - nip.io

Production: - Amazon Route53

# Kubernetes

Cluster Type: - Kind

Nodes: - 1 Control Plane - 2 Worker Nodes

Ingress: - NGINX Ingress Controller

# Monitoring

-   Prometheus
-   Grafana
-   Loki
-   Promtail

# CI/CD Flow

``` text
Developer
    ↓
Git Push
    ↓
GitHub Actions
    ↓
Docker Build
    ↓
Docker Hub
    ↓
ArgoCD
    ↓
Kind Cluster
```

# Estimated Resources

  Resource                    Quantity
  ------------------ -----------------
  VPC                                1
  Internet Gateway                   1
  Public Subnets                     2
  Route Table                        1
  Security Group                     1
  IAM Role                           1
  EC2                                1
  Elastic IP           1 (recommended)

# Future Production Architecture

For AWS production replace Kind with:

-   Amazon EKS
-   Managed Node Groups
-   ALB Ingress Controller
-   Amazon ECR
-   Route53
-   ACM
-   IRSA
-   Terraform
-   Karpenter
-   Velero

This document is intended to explain the infrastructure choices for the
EasyShop-KIND project during interviews and portfolio reviews.
