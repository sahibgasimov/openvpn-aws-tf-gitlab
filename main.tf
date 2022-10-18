data "aws_ami" "latest-ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



resource "aws_security_group" "vpnsecuritygroup" {
  name        = "Open VPN Security Group"
  description = "Allow http and https"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 943
    to_port     = 943
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "openvpnserver" {
  ami                    = data.aws_ami.latest-ubuntu.id
  instance_type          = var.instancetype
  user_data              = data.template_file.userdata.rendered
  key_name               = var.keyname
  vpc_security_group_ids = ["${aws_security_group.vpnsecuritygroup.id}"]
  subnet_id              = var.subnetid
  iam_instance_profile   = "Openvpn"

  tags = {
    Owner = "${var.owner}"
    Name  = "${var.instancename}"
  }
  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}

/* 
#EBS Volume
resource "aws_ebs_volume" "openvpn_data" {
  availability_zone = "us-east-1a"
  size              = "30"
  encrypted         = true

  lifecycle {
    prevent_destroy = false
  }
}

#EBS Volume Attachment
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.openvpnserver.id
  volume_id   = aws_ebs_volume.openvpn_data.id

} */


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

