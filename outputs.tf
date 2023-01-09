// Instance Name
output "instancename" {
  value = module.ec2-instance.id
}

// Instance Private IPv4
output "privateip" {
  value = module.ec2-instance.private_ip
}

output "adminurl" {
  value       = "https://${aws_route53_record.pan.fqdn}/admin"
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

output "instance_id" {
  value = [module.ec2-instance.id]
}
