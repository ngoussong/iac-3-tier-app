resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.env}-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-sg"
  description = "Allow DB access from EC2s"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow DB access"
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = var.allowed_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-rds-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier             = "${var.env}-db"
  allocated_storage      = 20
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = var.db_port
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  multi_az               = var.multi_az
  publicly_accessible    = false

  tags = {
    Name = "${var.env}-db"
  }
}
