resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  # Must be enabled for EFS can be used, EBS cant be used with EKS fargate
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}