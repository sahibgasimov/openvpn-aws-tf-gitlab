variable "ami" {
  description = "AMI to be used, default is Ubuntu 18.67 Bionic"
  default     = "ami-0574da719dca65348"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc" {
  description = "AWS VPC"
  default     = "vpc-078c570d11b3fbf7b"
}


variable "instancetype" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "instancename" {
  description = "EC2 instance name"
  default     = "Openvpn"
}

variable "instance_id" {
  default = ""
}

variable "keyname" {
  description = "SSH key name"
  default     = "araderoo"
}

variable "key_country" {
  default = "US"
}

variable "key_province" {
  default = "IL"
}

variable "key_city" {
  default = "Chicago"
}

variable "key_org" {
  default = "SG"
}

variable "key_email" {
  default = "araderoo@yahoo.com"
}

variable "key_ou" {
  default = "SG"
}

variable "passwd" {
  description = "OpenVPN admin password"
  default     = "Amgen2018"
  sensitive   = true
}

variable "domain" {
  description = "OpenVPN server TLD"
  default     = "sahibgasimov.link"
}

variable "sslmail" {
  description = "E-Mail for LetsEncrypt"
  default     = "araderoo@yahoo.com"
}

variable "owner" {
  description = "Owner Tag for AWS console"
  default     = "openvpn"
}

variable "subdomain" {
  description = "Subdomain"
  default     = "pan"
}

variable "subnetid" {
  description = "Subnet for the VPN Instance"
  default     = "subnet-04f9ccb10411841ae"
}

variable "adminurl" {
  description = "OpenVPN Admin login"
  default     = "sahib"
}

# Provider Variables

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  default     = "AKIAUTVYRMFDHGO4AB7E"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  default     = "Ncyw8xxGsd1PQEomINpOln0jsgKu9j6Gj+rBwdqv"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_access_key_main" {
  type        = string
  description = "AWS access key"
  default     = "AKIAWKDHFPYSZFDXT4OH"
}

variable "aws_secret_key_main" {
  type        = string
  description = "AWS secret key"
  default     = "Mj4htuW7ThZJ74V42xkrhACK/+h7FgEKlg5ZPSxh"
}

variable "aws_region_main" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}
