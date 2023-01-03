// Instance Name
output "instancename" {
  value = module.ec2-instance.id
}

/* // Instance Pupblic IPv4
output "publicip" {
  value = module.ec2-instance.public_ip
} */

// Userdata for openvpn Setup
/* output "userdata" {
  value = module.ec2-instance.user_data
} */

// Instance Private IPv4
output "privateip" {
  value = module.ec2-instance.private_ip
}

// Instance Type
/* output "instancetype" {
  value = module.ec2-instance.instance_type
} */

// Instance SSH Keyname
/* output "keyname" {
  value = module.ec2-instance.key_name
} */

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


/* output "security_group_id" {
  value = aws_security_group.security_group.id
} */

output "instance_id" {
  value = [module.ec2-instance.id]
}