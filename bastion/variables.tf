variable "create_bastion_host" {
    default = true
}

variable "public_subnet_id" {
    description = "subnet where bastion host is placed"
}

variable "allow_ssh_id" {
  description = "allow shh into bastion host"
}