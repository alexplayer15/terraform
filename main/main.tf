module "bastion" {
    source = "../bastion"

    public_subnet_id = module.vpc.public_subnet_id
    allow_ssh_id = module.security.allow_ssh_id
}

module "vpc" {
    source = "../vpc"
}

module "security" {
    source = "../security"

    vpc_main_id = module.vpc.vpc_main_id
    private_subnet_id = module.vpc.private_subnet_id
    public_subnet_id = module.vpc.public_subnet_id
}

module "app" {
    source = "../app"

    public_subnet_id = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
    allow_bastion_host_id = module.security.allow_bastion_host_id
    allow_ssh_id = module.security.allow_ssh_id
    create_bastion_host = module.bastion.create_bastion_host
}
