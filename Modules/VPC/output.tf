
#Externalização das Variáveis da VPC

output "iac_id" {
  value = "${aws_vpc.iac.id}"
}

output "iac_security_group_pub_id" {
    value = "${aws_security_group.iac_security_group_pub.id}"
}

output "iac_security_group_priv_id" {
    value = "${aws_security_group.iac_security_group_priv.id}"
}


# Externalização das Variáveis de Subnet Pública

output "sn_iac_pub_1a_id" {
  value = "${aws_subnet.sn_iac_pub_1a.id}"
}

output "sn_iac_pub_1b_id" {
  value = "${aws_subnet.sn_iac_pub_1b.id}"
}

output "sn_iac_priv_1a_id" {
  value = "${aws_subnet.sn_iac_priv_1a.id}"
}

output "sn_iac_priv_1b_id" {
  value = "${aws_subnet.sn_iac_priv_1b.id}"
}