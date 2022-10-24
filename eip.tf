# resource block for eip #
resource "aws_eip" "myeip" {
  vpc = true
  instance = aws_instance.openvpn.id
  tags = {
    Name = "${var.instancename}"
  }
}

# resource block for ec2 and eip association #
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.openvpn.id
  allocation_id = aws_eip.myeip.id
}


