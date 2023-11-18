resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH"
  vpc_id      = var.vpc_main_id

  ingress {
    description      = "SSH from web"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_CIDR]
  }

  egress {
    description = "allow traffic into private"
    from_port        = var.all_port
    to_port          = var.all_port
    protocol         = var.all_protocol
    cidr_blocks      = [var.allow_all_CIDR]
  }

  tags = {
    Name = "allow ssh from the web"
  }

}

resource "aws_security_group" "allow_bastion_host" {
  name        = "allow_bastion_host"
  description = "Allows bastion host to SSH into the instance"
  vpc_id      = var.vpc_main_id

  ingress {
    description      = "SSH from bastion host"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = [var.allow_all_CIDR]
  }

  egress {
    description      = "SSH from bastion host"
    from_port        = var.all_port
    to_port          = var.all_port
    protocol         = var.all_protocol
    cidr_blocks      = [var.allow_all_CIDR]

  }

  tags = {
    Name = "allow ssh into the bastion host"
  }
}


