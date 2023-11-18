resource "aws_network_acl" "public_nacl" {
  vpc_id = var.vpc_main_id

  egress {
    protocol   = var.all_protocol
    rule_no    = 100
    action     = "allow"
    cidr_block = var.allow_all_CIDR
    from_port  = var.all_port
    to_port    = var.all_port
  }

  ingress {
    protocol   = var.all_protocol
    rule_no    = 100
    action     = "allow"
    cidr_block = var.allow_all_CIDR
    from_port  = var.all_port
    to_port    = var.all_port
  }

  tags = {
    Name = "nacl allowing SSH into bastion host"
  }
}

# resource "aws_network_acl_rule" "deny_all_public" {
#   network_acl_id = aws_network_acl.public_nacl.id
#   rule_number    = 200
#   egress         = false
#   protocol       = "tcp"
#   rule_action    = "deny"
#   cidr_block     = var.allow_all_CIDR
#   from_port      = 0
#   to_port        = 65535
# }

resource "aws_network_acl_association" "public" {
  subnet_id          = var.public_subnet_id
  network_acl_id     = aws_network_acl.public_nacl.id
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = var.vpc_main_id

  egress {
    protocol   = var.all_protocol
    rule_no    = 100
    action     = "allow"
    cidr_block = var.allow_all_CIDR
    from_port  = var.all_port
    to_port    = var.all_port
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.allow_all_CIDR
    from_port  = var.ssh_port
    to_port    = var.ssh_port
  }

  tags = {
    Name = "allow ssh from bastion host"
  }
}

resource "aws_network_acl_association" "private" {
  subnet_id          = var.private_subnet_id
  network_acl_id     = aws_network_acl.private_nacl.id
}


