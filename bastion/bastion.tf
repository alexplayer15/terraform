resource "aws_instance" "bastion_host" {
    ami = "ami-0b25f6ba2f4419235"
    instance_type = "t2.micro"
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [var.allow_ssh_id]
    # count = var.create_bastion_host == true ? 1:0
    source_dest_check = false
    key_name = "bastion-key-pair"

    tags = {
        Name = "bastion host"
    }
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion_host.id
  domain   = "vpc"
  #count = var.create_bastion_host == true ? 1:0 
}

# resource "null_resource" "configure_ssh" {
#   triggers = {
#     eip_id = aws_eip.bastion.id
#   }

  # provisioner "local-exec" {
  #   command = <<-EOT
  #     echo "Host bastion_host" >> /home/alex_player/.ssh/config
  #     echo "HostName ${aws_eip.bastion.public_ip}" >> /home/alex_player/.ssh/config
  #     echo "User ec2-user" >> /home/alex_player/.ssh/config
  #     echo "IdentityFile /home/alex_player/bastion_key" >> /home/alex_player/.ssh/config
  #     echo "ForwardAgent yes" >> /home/alex_player/.ssh/config
  #   EOT
  #   }
  #}


