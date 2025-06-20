variable "env" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

# Bastion host
variable "bastion_ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for bastion host"
  type        = string
}

variable "trusted_ip" {
  description = "IP autorisée au SSH"
  type        = string
}

# EC2 App
variable "app_ami_id" {
  description = "AMI ID for the app EC2 instance"
  type        = string
}

variable "app_instance_type" {
  description = "Instance type for the app EC2 instance"
  type        = string
}

# SSH Key
variable "public_key_path" {
  description = "Path to the public key file for SSH"
  type        = string
}

# RDS
variable "db_name" {
  description = "Name for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_instance_type" {
  description = "Instance type for the RDS"
  type        = string
}
