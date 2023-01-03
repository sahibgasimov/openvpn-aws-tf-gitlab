# resource block for eip #
resource "aws_eip" "myeip" {
  vpc      = true
  instance = module.ec2-instance.id
  tags = {
    Name = "${var.instancename}"
  }
}

# resource block for ec2 and eip association #
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2-instance.id
  allocation_id = aws_eip.myeip.id
}


