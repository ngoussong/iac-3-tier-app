variable "bucket_name" {
  description = "Nom du bucket S3 pour stocker le state Terraform"
  type        = string
}

variable "lock_table_name" {
  description = "Nom de la table DynamoDB pour le verrouillage du state"
  type        = string
}

variable "environment" {
  description = "Nom de l'environnement (dev/test/prod)"
  type        = string
}
