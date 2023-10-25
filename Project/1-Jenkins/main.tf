resource "aws_instance" "jenkins-server" {
  ami                    = "ami-0cbd40f694b804622"
  instance_type          = "t2.medium"
  availability_zone      = "us-west-1a"
  key_name               = "kube-demo"
  vpc_security_group_ids = ["sg-001b025721b4285f4"]

  tags = {
    Name    = "jenkins-server"
    Project = "Gonje"
  }

  # Pass the content of the script as user_data
  user_data = file("jenkins.sh")
}