variable "ami" {
  description = "AMI to be used, default is Ubuntu 22 Bionic"
  default     = "ami-0ff39345bd62c82a5"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc" {
  description = "AWS VPC"
  default     = ""
}


variable "instancetype" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "instancename" {
  description = "EC2 instance name"
  default     = ""
}

variable "instance_id" {
  default = ""
}

variable "keyname" {
  description = "SSH key name"
  default     = ""
}

variable "key_country" {
  default = ""
}

variable "key_province" {
  default = ""
}

variable "key_city" {
  default = ""
}

variable "key_org" {
  default = ""
}

variable "key_email" {
  default = ""
}

variable "key_ou" {
  default = "SG"
}

variable "passwd" {
  description = "OpenVPN admin password"
  default     = ""
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
  default     = ""
}

variable "adminurl" {
  description = "OpenVPN Admin login"
  default     = "sahib"
}

# Provider Variables

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  default     = ""
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  default     = ""
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_access_key_main" {
  type        = string
  description = "AWS access key"
  default     = ""
}

variable "aws_secret_key_main" {
  type        = string
  description = "AWS secret key"
  default     = ""
}

variable "aws_region_main" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}
