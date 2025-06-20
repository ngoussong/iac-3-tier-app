provider "aws" {
  region  = var.aws_region
  profile = "fonda"
}

module "vpc" {
  source               = "../../modules/vpc"
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "bastion" {
  source          = "../../modules/bastion"
  env             = var.env
  vpc_id          = module.vpc.vpc_id
  subnet_id       = element(module.vpc.public_subnets, 0)
  ami_id          = data.aws_ami.ubuntu.id
  instance_type   = var.bastion_instance_type
  public_key_path = var.public_key_path
  trusted_ip      = var.trusted_ip
}

module "ec2_app" {
  source             = "../../modules/ec2_app"
  env                = var.env
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  allowed_sg_ids     = [module.bastion.bastion_sg_id]
  ami_id             = data.aws_ami.ubuntu.id
  instance_type      = var.app_instance_type
  key_name           = "${var.env}-bastion-key"

}

module "rds" {
  source                     = "../../modules/rds"
  env                        = var.env
  vpc_id                     = module.vpc.vpc_id
  private_subnet_ids         = module.vpc.private_subnets
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
  instance_class             = var.db_instance_type
  allowed_security_group_ids = [module.ec2_app.app_sg_id]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}