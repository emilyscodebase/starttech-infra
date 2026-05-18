# StartTech Infrastructure

## Overview
This repository contains the Infrastructure as Code (IaC) for the StartTech application using Terraform on AWS.

## Infrastructure Components
- VPC with public and private subnets
- Application Load Balancer
- Auto Scaling Group for EC2 instances
- ECR repository for Docker images
- S3 bucket for frontend hosting
- CloudFront CDN distribution
- ElastiCache Redis cluster
- CloudWatch Log Groups and Dashboard

## Prerequisites
- AWS CLI configured
- Terraform installed
- AWS account with proper permissions

## Getting Started

### Deploy Infrastructure
```bash
./scripts/deploy-infrastructure.sh
```

### Manual Deployment
```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
```

## CI/CD Pipeline
Infrastructure is automatically deployed via GitHub Actions when changes are pushed to the main branch in the terraform/ folder.

## Monitoring
- CloudWatch Dashboard: starttech-dashboard
- Log Groups: /starttech/starttech/backend and /starttech/starttech/frontend
- Alarms: CPU utilization > 80%
