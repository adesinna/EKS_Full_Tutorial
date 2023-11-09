provider "aws" {
  region = "us-west-1"

}

resource "aws_instance" "intro" {
  ami                    = "ami-0cbd40f694b804622"
  instance_type          = "t2.micro"
  availability_zone      = "us-west-1a"
  key_name               = "kube-demo"
  vpc_security_group_ids = ["sg-0a122d2acd39291c4"]
  tags = {
    Name    = "Database Server"
    Project = "Gonje"
  }
}
