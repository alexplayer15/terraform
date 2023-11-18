output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
    value = aws_subnet.private_subnet.id
}

output "vpc_main_id" {
    value = aws_vpc.main.id
}