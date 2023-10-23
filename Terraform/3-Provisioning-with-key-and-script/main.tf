resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey" # private key ssh-keygen
  public_key = file("dovekey.pub") # the public ssh-keygen
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name # the private key from the aws_key_pair dove key
  vpc_security_group_ids = ["sg-0780815f55104be8a"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh" # source in the host
    destination = "/tmp/web.sh" # where you want it to be in the ec2 instance
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh", # this will change the mode at this location
      "sudo /tmp/web.sh" # this command execute the script at this location
    ]
  }

  connection { # ssh connection
    user        = var.USER # the user
    private_key = file("dovekey") # the private key
    host        = self.public_ip # public ip
  }
}

output "PublicIP" {
  value = aws_instance.dove-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.dove-inst.private_ip
}