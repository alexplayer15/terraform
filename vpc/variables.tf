variable "ssh_protocol" {
    default = "22"
}

variable "public_ip" {
    default = "192.168.0.17/32"
}

variable "vpc_CIDR" {
    default = "10.0.0.0/16"
}

variable "public_CIDR" {
    default = "10.0.1.0/24"
}

variable "private_CIDR" {
    default = "10.0.2.0/24"
}

variable "allow_all_CIDR" {
    default = "0.0.0.0/0"
}

