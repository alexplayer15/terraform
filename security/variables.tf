variable "all_port" {
    default = "0"
}

variable "all_protocol" {
    default = "-1"
}

variable "ssh_port" {
    default = "22"
}

variable "public_ip" {
    sensitive = true
    default = "0.0.0.0/0"
}

variable "allow_all_CIDR" {
    default = "0.0.0.0/0"
}

variable "vpc_main_id" {
    description = "place in main VPC"
}

variable "private_subnet_id" {
    description = "allocate to private subnet"
}

variable "public_subnet_id" {
    description = "allocate to public subnet"
}


