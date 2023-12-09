resource "aws_security_group" "payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  ingress {
    description = "ingress allows HTTPS  from DEV VPC"
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }
  ingress {
    description = "ingress allows APIs access from DEV VPC"
    from_port   = var.api-dev
    to_port     = var.api-dev
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }
  ingress {
    description = "ingress allows APIs access from Prod App Public IP."
    from_port   = var.api-prod
    to_port     = var.api-prod
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }
  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "payment_app"
    Environment = "DEV"
    Team        = "MyTeam"
  }
}



