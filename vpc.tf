resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public subnet for bastion host"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Private subnet for EC2 instance"
  }
}

resource "aws_route_table" "main_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "mainsub-igw" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main_table.id
}

resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}