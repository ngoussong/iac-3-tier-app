variable "bucket_name" {
  description = "Nom du bucket S3 qui contiendra le state Terraform"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nom de la table DynamoDB pour le state locking"
  type        = string
}

variable "region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environnement cible"
  type        = string
  default     = "bootstrap"
}
