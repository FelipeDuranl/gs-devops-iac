resource "aws_db_subnet_group" "rds_vpc_gsi_sg" {
  name       = "rds_vpc_gsi_sg"
  subnet_ids = ["${var.sn_vpc_gsi_priv_2a_id}", "${var.sn_vpc_gsi_priv_2b_id}"]

  tagsi = {
    "Name" = "rds_vpc_gsi_sg"
  }
}

resource "aws_db_parameter_group" "rds_vpc_gsi_parameter_group" {
  name   = "rds-vpc-gsi-parameter-group"
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

resource "aws_db_instance" "rds_db_gsi" {
  identifier              = "rds-db-gsi"
  multi_az                = "${var.multi_az}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.instance_class}"
  storage_type            = "${var.storage_type}"
  allocated_storage       = "${var.allocated_storage}"
  max_allocated_storage   = 0
  monitoring_interval     = 0
  name                    = "${var.rds_name}"
  username                = "${var.rds_user}"
  password                = "${var.rds_password}"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_vpc_gsi_sg.name
  parameter_group_name    = aws_db_parameter_group.rds_vpc_gsi_parameter_group.name
  vpc_security_group_ids  = ["${var.vpc_gsi_security_group_priv_id}"]

  tagsi = {
    "Name" = "rds-db-gsi"
  }
}
