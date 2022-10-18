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
  default     = "vpc-08fb66c3c7ffa6eaa"
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
  default     = "openvpn"
}

variable "instance_id" {
  default = "i-04edb4b9cd579fbe5"
}

variable "keyname" {
  description = "SSH key name"
  default     = "openvpn-1"
}

variable "sns" {
  default = "arn:aws:sns:us-east-1:226673603208:Default_CloudWatch_Alarms_Topic_Gmail"
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
  default = "sahib.gasimov2@gmail.com"
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
  default     = "sahib.gasimov2@gmail.com"
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
  default     = "subnet-08617d8d079cb7bc3"
}

variable "adminurl" {
  description = "OpenVPN Admin login"
  default     = "sahib"
}

# Provider Variables

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  default     = "AKIATJRWMWKEP2UBOLVM"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  default     = "12TmQcrTOLaXfk7n0/yTdYNLtU/pVM1fbRNQ+i6q"
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
