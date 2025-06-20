resource "aws_security_group" "app" {
  name        = "${var.env}-app-sg"
  description = "Security Group for private EC2 app"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = var.allowed_sg_ids
    description     = "Allow traffic from bastion or load balancer"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-app-sg"
  }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnet_ids, 0)
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name               = var.key_name

  tags = {
    Name = "${var.env}-app-instance"
  }
}
