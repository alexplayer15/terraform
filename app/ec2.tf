resource "aws_instance" "website_ec2" {
    ami = "ami-0b25f6ba2f4419235"
    instance_type = "t2.micro"
    subnet_id = local.create_bastion_host == true ? var.private_subnet_id : var.public_subnet_id
    vpc_security_group_ids = local.create_bastion_host== true ? [var.allow_ssh_id] : [var.allow_bastion_host_id]
    key_name = "app-key-pair"


    tags = {
        Name = "website_ec2"
        Environment = "Production"
    }

    # provisioner "local-exec" {
    #   command = "ansible-playbook -i /home/alex_player/Ansible/Inventory/aws_ec2.yaml -u ec2-user /home/alex_player/Ansible/Inventory/website_playbook.yml"
    # }

    # provisioner "local-exec" {
    #   command = <<-EOT

    #   echo "Host ec2_instance" >> /home/alex_player/.ssh/config
    #   echo "HostName ${aws_instance.website_ec2.public_ip}" >> /home/alex_player/.ssh/config
    #   echo "User ec2-user" >> /home/alex_player/.ssh/config
    #   echo "IdentityFile /home/alex_player/bastion_key" >> /home/alex_player/.ssh/config
    #   echo "ProxyJump bastion_host" >> /home/alex_player/.ssh/config
    # EOT
    # }
}

locals {
  create_bastion_host = var.create_bastion_host
}

