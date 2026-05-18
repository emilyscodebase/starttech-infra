# StartTech Infrastructure Architecture

## Overview
StartTech infrastructure is managed with Terraform on AWS.

## Components

### Networking
- VPC with public and private subnets
- Internet Gateway
- Security Groups for ALB and EC2

### Compute
- EC2 instances behind Application Load Balancer
- Auto Scaling Group (1-4 instances)
- ECR repository for Docker images

### Storage
- S3 bucket for frontend hosting
- CloudFront CDN for global delivery

### Monitoring
- CloudWatch Log Groups
- CloudWatch Dashboard
- CloudWatch Alarms

## CI/CD
Infrastructure changes are deployed automatically via GitHub Actions when Terraform files change.
