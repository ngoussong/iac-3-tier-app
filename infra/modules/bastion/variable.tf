variable "env" {
  description = "Nom de l'environnement (dev/test/prod)"
  type        = string
}

variable "public_key_path" {
  description = "Chemin vers la clé publique SSH (ex: ~/.ssh/id_rsa.pub)"
  type        = string
  default     = "/home/fonda/.ssh/id_rsa.pub"
}

variable "trusted_ip" {
  description = "Adresse IP autorisée à se connecter en SSH (ex: 192.168.1.1/32)"
  type        = string
}

variable "ami_id" {
  description = "ID de l'image AMI pour l'instance bastion"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2 pour le bastion"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID du subnet public où sera déployé le bastion"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}
