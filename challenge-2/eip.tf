resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    Name        = "payment_app"
    Environment = "DEV"
    Team        = "MyTeam"
  }
}