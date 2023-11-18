
# resource "aws_lb" "applicationlayer" {
#   name               = "application-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.lb_sg.id]
#   subnet           = "application-az"

#   enable_deletion_protection = true

#   access_logs {
#     bucket  = alblogs.lb_logs.id
#     prefix  = "application-lb"
#     enabled = true
#   }

#   tags = {
#     Environment = "production"
#   }
# }

# resource "aws_s3_bucket" "alblogs" {
#   bucket = "my-alb-logs-bucket"

#   tags = {
#     Name        = "ALB Request Logs"
#     Environment = "production"
#   }
# }

