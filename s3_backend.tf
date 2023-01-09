terraform {
  backend "s3" {
    bucket = ""
    key    = "openvpn/terraform.tfstate"
    region = "us-east-2"
  }
}
