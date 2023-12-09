variable "splunk" {
  default = "8088"
}
variable "cidr" {
  default = "172.31.0.0/16"
}
variable "https" {
  default = 443
}
variable "api-dev" {
  default = 8080
}
variable "api-prod" {
  default = 8443
}