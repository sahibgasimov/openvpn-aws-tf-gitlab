terraform {
  backend "s3" {
    bucket = "sahib-aws-openvpn"
    key    = "openvpn/terraform.tfstate"
    region = "us-east-1"
  }
}