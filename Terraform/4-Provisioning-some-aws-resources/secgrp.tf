resource "aws_security_group" "dove_stack_sg" {  # security group
  vpc_id      = aws_vpc.dove.id # the vpc where you want it to be created
  name        = "dove-stack-sg"
  description = "Sec Grp for dove ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # allows all types of protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP] # allows ssh for my ip
  }
  tags = {
    Name = "allow-ssh"
  }
}
