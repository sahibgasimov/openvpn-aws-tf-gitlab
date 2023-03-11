resource "aws_iam_instance_profile" "openvpn-iam-profile" {
  name = "ec2_profile"
  role = aws_iam_role.openvpn-iam-role.name
}
resource "aws_iam_role" "openvpn-iam-role" {
  name               = "openvpn-ssm-role"
  description        = "The role for the developer resources EC2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags = {
    stack = "openvpn"
  }
}
resource "aws_iam_role_policy_attachment" "openvpn-ssm-policy" {
  role       = aws_iam_role.openvpn-iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
