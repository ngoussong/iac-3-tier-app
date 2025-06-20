terraform {
  backend "s3" {
    bucket         = "iac-3tier-terraform-state"      # Doit correspondre à ce que tu as créé avec le bootstrap
    key            = "dev/terraform.tfstate"          # Clé de stockage (par ex. dev, test, prod)
    region         = "us-east-1"                      # Même région que ton S3
    dynamodb_table = "terraform-locks"                # Nom de la table DynamoDB
    encrypt        = true
  }
}