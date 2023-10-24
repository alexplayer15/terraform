resource "aws_instance""bastion_host" {
    ami = "ami-0b25f6ba2f4419235"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "bastion host"
    }
}

resource "aws_eip" "lb" {
  instance = aws_instance.bastion_host.id
  domain   = "vpc"
}

resource "aws_instance""private_ec2" {
    ami = "ami-0b25f6ba2f4419235"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.allow_bastion_host.id]

    tags = {
        Name = "private ec2 instance"
    }
}
