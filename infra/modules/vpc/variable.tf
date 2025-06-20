variable "env" {
  description = "Environnement (ex: dev, test, prod)"
  type        = string
}

# variable "aws_region" {
#   type    = string
# }

variable "vpc_cidr" {
  description = "CIDR block du VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Liste des CIDR des subnets publics"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Liste des CIDR des subnets privés"
  type        = list(string)
}

variable "azs" {
  description = "Liste des Availability Zones"
  type        = list(string)
}