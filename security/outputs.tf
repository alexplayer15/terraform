output "allow_ssh_id" {
  value = aws_security_group.allow_ssh.id
}

output "allow_bastion_host_id" {
    value = aws_security_group.allow_bastion_host.id
}