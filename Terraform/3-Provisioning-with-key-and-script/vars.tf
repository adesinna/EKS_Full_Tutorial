variable REGION {
  default = "us-west-1"
}

variable ZONE1 {
  default = "us-west-1a"
}

variable AMIS {
  type = map # this shows it maps
  default = {              # it works like if statement
    us-east-2 = "ami-0e83be366243f524a"  # pick this ami if we choose us east 2
    us-west-1 = "ami-0cbd40f694b804622"  # pick this ami if we choose us east 1
  }
}

variable USER {
  default = "ubuntu"
}