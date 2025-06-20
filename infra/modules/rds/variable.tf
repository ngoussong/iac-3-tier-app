variable "env" {
  description = "Environnement (ex: dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Liste des sous-réseaux privés"
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "SGs autorisés à se connecter à la DB"
  type        = list(string)
}

variable "engine" {
  default     = "postgres"
  description = "Type de moteur de base de données"
  type        = string
}

variable "engine_version" {
  default     = "17.5"
  description = "Version du moteur"
  type        = string
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "Type d’instance RDS"
  type        = string
}

variable "db_name" {
  description = "Nom de la base"
  type        = string
}

variable "db_username" {
  description = "Nom d'utilisateur DB"
  type        = string
}

variable "db_password" {
  description = "Mot de passe DB"
  type        = string
  sensitive   = true
}

variable "db_port" {
  default     = 5432
  description = "Port DB"
  type        = number
}

variable "multi_az" {
  default     = false
  description = "Activer la haute dispo (Multi-AZ)"
  type        = bool
}
