variable "ami" {
  description = "AMI to be used, default is Ubuntu 18.67 Bionic"
  default     = "ami-090f10efc254eaf55"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc" {
  description = "AWS VPC"
  default     = ""
}

/* variable "profile" {
  description = "AWS Profile"
  default     = "default"

} */

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
  default     = "openvpn-1"
}

variable "sns" {
  default = ""
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
  default     = ""
}

variable "sslmail" {
  description = "E-Mail for LetsEncrypt"
  default     = ""
}

variable "owner" {
  description = "Owner Tag for AWS console"
  default     = "openvpn"
}

variable "subdomain" {
  description = "Subdomain"
  default     = "vpn"
}

variable "subnetid" {
  description = "Subnet for the VPN Instance"
  default     = ""
}

variable "adminurl" {
  description = "OpenVPN Admin login"
  default     = ""
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
