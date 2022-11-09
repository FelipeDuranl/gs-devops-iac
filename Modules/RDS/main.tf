
#DataBase Subnet Group

resource "aws_db_subnet_group" "rds_vpc_iac_sg" {
  name       = "rds_vpc_iac_sg"
  subnet_ids = ["${var.sn_vpc_iac_pub2_1a_id}", "${var.sn_vpc_iac_pub2_1b_id}"]

  tags = {
    "Name" = "rds_vpc_iac_sg"
  }
}

#DB Parameter Group
resource "aws_db_parameter_group" "rds_vpc_iac_parameter_group" {
  name   = "rds-vpc-iac-parameter-group"
  family = "${var.family}"

  parameter {
    name  = "character_set_server"
    value = "${var.charset}"
  }

  parameter {
    name  = "character_set_client"
    value = "${var.charset}"
  }
}

#instância rds
resource "aws_db_instance" "rds_db_challenge" {
  identifier              = "rds-db-challenge"
  multi_az                = "${var.multi_az}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.instance_class}"
  storage_type            = "${var.storage_type}"
  allocated_storage       = "${var.allocated_storage}"
  max_allocated_storage   = 0
  monitoring_interval     = 0
  name                    = "${var.db_name}"
  username                = "${var.db_user}"
  password                = "${var.db_password}"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_vpc_iac_sg.name
  parameter_group_name    = aws_db_parameter_group.rds_vpc_iac_parameter_group.name
  vpc_security_group_ids  = ["${var.vpc_iac_security_group_priv_id}"]

  tags = {
    "Name" = "rds-db-challenge"
  }
}

