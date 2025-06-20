provider "aws" {
  region  = var.region
  profile = "fonda"
}

module "bootstrap_state" {
  source          = "../modules/bootstrap_state"
  bucket_name     = var.bucket_name
  lock_table_name = var.dynamodb_table_name
  environment     = var.environment
}
