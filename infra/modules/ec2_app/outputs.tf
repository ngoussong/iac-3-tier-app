output "app_sg_id" {
  description = "Security Group ID of the app EC2"
  value       = aws_security_group.app.id
}
