terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.46.0"
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.4.3"
    }

    tls = {
      source = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
  }

  backend "s3" {
    bucket         	   = "terra-eks12" # ensure bucket and cluster are in the same region
    key              	   = "state/terraform.tfstate" # create a folder called state
    region         	   = "us-east-1" # the region where the bucket is created
  }

  required_version = "~> 1.3"
}