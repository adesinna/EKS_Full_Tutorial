resource "aws_instance" "jenkins-server" {
  ami                    = "ami-04f5097681773b989"
  instance_type          = "t2.medium"
  availability_zone      = "ap-southeast-2a"
  key_name               = "jenkins-key"
  vpc_security_group_ids = ["sg-092890e1846a041b5"]

  tags = {
    Name    = "jenkins-server"
    Project = "Gonje"
  }

  # Pass the content of the script as user_data
  user_data = file("jenkins.sh")
}