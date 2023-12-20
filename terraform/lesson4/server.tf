# Create public IPs


data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "name"
    values = ["CentOS-${var.centos_ver}*x86_64*"]
  }

}


resource "aws_instance" "server" {
  ami           = data.aws_ami.centos.id
  instance_type = var.aws_instance_size

  vpc_security_group_ids      = [aws_security_group.first_sg.id]
  subnet_id                   = aws_subnet.first_subnet.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.auth.key_name
  root_block_device {
    delete_on_termination = true
    volume_size           = 20
    volume_type           = "gp2"
  }
  provisioner "remote-exec" {
    inline = [
      "ls -l",

    ]
    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("${var.private_sshkey}")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "${var.aws_vpc_name}-Server"
  }
}

