resource "aws_vpc" "main" {
  cidr_block       = var.vpc_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_CIDR

  tags = {
    Name = "Public subnet for bastion host"
  }
}

resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.allow_all_CIDR
    gateway_id = aws_internet_gateway.pubsub_igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_table.id
}

resource "aws_internet_gateway" "pubsub_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_CIDR

  tags = {
    Name = "Private subnet for EC2 instance"
  }
}

resource "aws_route_table" "private_table" {
  vpc_id = aws_vpc.main.id

  # route {
  #   cidr_block = var.allow_all_CIDR
  #   network_interface_id = "${aws_network_interface.bastion_host.id}"
  # }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "private_assocation" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_table.id
}