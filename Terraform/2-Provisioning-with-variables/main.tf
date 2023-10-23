resource "aws_instance" "intro" {
  ami                    = var.AMIS[var.REGION] # pick ami in the region
  instance_type          = "t2.medium"
  availability_zone      = var.ZONE1
  key_name               = "kube-demo"
  vpc_security_group_ids = ["sg-001b025721b4285f4"]
  tags = {
    Name    = "Jenkins Server"
    Project = "Gonje"
  }
}
