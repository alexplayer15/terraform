variable "public_subnet_id" {
    description = "place ec2 instance in public subnet"
}

variable "private_subnet_id" {
    description = "place ec2 instance in public subnet"
}

variable "allow_bastion_host_id" {
    description = "allow bastion host security group"
}

variable "allow_ssh_id" {
    description = "allow ssh into instance"
}

variable "create_bastion_host" {
    description = "determines whether to create a bastion host"
}