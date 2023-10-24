resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH from web"
    from_port        = var.ssh_protocol
    to_port          = var.ssh_protocol
    protocol         = "tcp"
    cidr_blocks      = [var.public_ip]
  }

  tags = {
    Name = "allow ssh into the bastion host"
  }
}

resource "aws_security_group" "allow_bastion_host" {
  name        = "allow_bastion_host"
  description = "Allows bastion host to SSH into the instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH from bastion host"
    from_port        = var.ssh_protocol
    to_port          = var.ssh_protocol
    protocol         = "tcp"
    cidr_blocks      = [aws_security_group.allow_ssh.id]
  }

  tags = {
    Name = "allow ssh into the bastion host"
  }
}
