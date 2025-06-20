variable "env" {
  description = "Nom de l'environnement"
  type        = string
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "Liste des sous-réseaux privés"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI à utiliser (ex: Amazon Linux 2023)"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  default     = "t3.micro"
  type        = string
}

variable "key_name" {
  description = "Nom de la clé SSH déjà créée"
  type        = string
}

variable "app_port" {
  description = "Port utilisé par l'application (ex: 8080)"
  default     = 8080
  type        = number
}

variable "allowed_sg_ids" {
  description = "SG autorisés à accéder à l'app (ex : bastion ou ALB)"
  type        = list(string)
}
