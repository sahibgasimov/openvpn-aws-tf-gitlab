
module "ec2-instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "4.2.1"
  ami                         = var.ami
  instance_type               = var.instancetype
  user_data                   = data.template_file.userdata.rendered
  key_name                    = var.keyname
  associate_public_ip_address = true
  /* vpc_security_group_ids = ["${aws_security_group.vpnsecuritygroup.id}"] */
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = var.subnetid
  iam_instance_profile   = aws_iam_instance_profile.openvpn-iam-profile.name
  enable_volume_tags     = true  
  tags = {
    Owner = "${var.owner}"
    Name  = "${var.instancename}"
  }
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 12
    },
  ]
}

data "template_file" "userdata" {
  template = file("userdata.sh")

  vars = {
    key_country  = "${var.key_country}"
    key_province = "${var.key_province}"
    key_city     = "${var.key_city}"
    key_org      = "${var.key_org}"
    key_email    = "${var.key_email}"
    key_ou       = "${var.key_ou}"
    passwd       = "${var.passwd}"
    domain       = "${var.domain}"
    sslmail      = "${var.sslmail}"
    subdomain    = "${var.subdomain}"
    instancetype = "${var.instancetype}"
    keyname      = "${var.keyname}"
    adminurl     = "${var.domain}"
  }
}

data "aws_vpc" "selected" {
  id = var.vpc
}
