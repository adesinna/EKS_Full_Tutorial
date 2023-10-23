provider "aws" {
  region = "us-west-1"

}

resource "aws_instance" "intro" {
  ami                    = "ami-0cbd40f694b804622"
  instance_type          = "t2.medium"
  availability_zone      = "us-west-1a"
  key_name               = "kube-demo"
  vpc_security_group_ids = ["sg-001b025721b4285f4"]
  tags = {
    Name    = "Jenkins Server"
    Project = "Gonje"
  }
}
