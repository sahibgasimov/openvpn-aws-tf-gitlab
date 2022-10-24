// Instance Name
output "instancename" {
  value = aws_instance.openvpn.arn
}

/* // Instance Pupblic IPv4
output "publicip" {
  value = aws_instance.openvpn.public_ip
} */

// Userdata for openvpn Setup
output "userdata" {
  value = aws_instance.openvpn.user_data
}

// Instance Private IPv4
output "privateip" {
  value = aws_instance.openvpn.private_ip
}

// Instance Type
output "instancetype" {
  value = aws_instance.openvpn.instance_type
}

// Instance SSH Keyname
output "keyname" {
  value = aws_instance.openvpn.key_name
}

output "adminurl" {
  value       = "https://${aws_route53_record.www.fqdn}/admin"
  description = "Admin Access URL for the openvpn"
}


#eip output 

output "id" {
  description = "Contains the EIP allocation ID"
  value       = aws_eip.myeip.id
}

output "public_ip" {
  description = "Contains the public IP address"
  value       = aws_eip.myeip.public_ip
}

output "public_dns" {
  description = "Public DNS associated with the Elastic IP address"
  value       = aws_eip.myeip.public_dns
}
