provider "kubernetes" {
  host = module.eks.cluster_endpoint  # this will give endpoint of the cluster when  it is created
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {} # it will get list of all the zones

locals {
  cluster_name = var.clusterName
}
