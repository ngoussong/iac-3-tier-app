output "vpc_id" {
  value = module.vpc.vpc_id
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

# output "app_private_ip" {
#   value = module.ec2_app.app_private_ip
# }

# output "rds_endpoint" {
#   value = module.rds.db_endpoint
# }
