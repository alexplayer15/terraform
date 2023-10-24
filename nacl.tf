resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = var.ssh_protocol
    to_port    = var.ssh_protocol
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.public_ip
    from_port  = var.ssh_protocol
    to_port    = var.ssh_protocol
  }

  tags = {
    Name = "nacl allowing SSH into bastion host"
  }
}

resource "aws_network_acl_rule" "deny_all_public" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "deny"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_association" "public" {
  subnet_id          = aws_subnet.public_subnet.id
  network_acl_id     = aws_network_acl.public_nacl.id
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = var.ssh_protocol
    to_port    = var.ssh_protocol
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_security_group.allow_ssh.id
    from_port  = var.ssh_protocol
    to_port    = var.ssh_protocol
  }

  tags = {
    Name = "allow ssh from bastion host"
  }
}

resource "aws_network_acl_association" "private" {
  subnet_id          = aws_subnet.private_subnet.id
  network_acl_id     = aws_network_acl.private_nacl.id
}

