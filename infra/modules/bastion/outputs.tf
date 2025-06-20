output "bastion_public_ip" {
  description = "Adresse IP publique du bastion"
  value       = aws_eip.bastion_eip.public_ip
}

output "bastion_instance_id" {
  description = "ID de l'instance EC2 bastion"
  value       = aws_instance.bastion.id
}

output "bastion_sg_id" {
  description = "Security Group ID of the bastion"
  value       = aws_security_group.bastion_sg.id
}
