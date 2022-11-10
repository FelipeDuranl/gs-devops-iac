
output "rds_endpoint" {
  value = "${aws_db_instance.rds_db_gsi.endpoint}"
}
