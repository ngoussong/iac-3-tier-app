output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "public_route_table_id" {
  description = "ID de la table de routage publique"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "Liste des IDs des tables de routage privées"
  value       = [for rt in aws_route_table.private : rt.id]
}