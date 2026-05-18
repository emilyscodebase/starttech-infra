# Infrastructure Runbook

## Deploy Infrastructure
```bash
./scripts/deploy-infrastructure.sh
```

## Destroy Infrastructure
```bash
cd terraform && terraform destroy -auto-approve
```

## Check AWS Resources
```bash
aws ec2 describe-instances --filters Name=tag:Name,Values=starttech-backend
aws elbv2 describe-load-balancers --names starttech-alb
aws s3 ls s3://starttech-frontend-rclm8np2
```

## Troubleshooting

### Terraform State Issues
```bash
cd terraform && terraform refresh
```

### Pipeline Failing
1. Check GitHub Actions logs
2. Verify AWS secrets are correct
3. Check IAM permissions
