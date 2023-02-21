terraform {
  backend "s3" {
    bucket = var.bucket_name
    key    = "openvpn/terraform.tfstate"
    region = var.region
  }
}
