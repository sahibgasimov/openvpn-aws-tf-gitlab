module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = "Open VPN Security Group"
  description = "vpn"
  vpc_id      = data.aws_vpc.selected.id
  egress_with_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
    },
  ]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
     {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = 943
      to_port     = 943
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = 1194
      to_port     = 1194
      protocol    = "udp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"

    },

  ]

  tags = {
    Name = "${var.instancename}"
  }
}
