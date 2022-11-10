variable "vpc_gsi_cidr" {
  description = "criação da variável o cidr block da VPC"
  default = "10.0.0.0/16"
}

variable "vpc_gsi_dns_hostname" {
  description = "declaração da variavel dns hostname"
  default = true
}

variable "vpc_gsi_dns_support" {
  description = "declaração da variavel dns support"
  default = true
}

variable "sn_vpc_gsi_pub_1a_cidr" {
  description = "Declaração do ip e cidr block que a subnet pub 1A irá usar"
  default = "10.0.101.0/24"
}

variable "sn_vpc_gsi_pub_1b_cidr" {
  description = "Declaração do ip e cidr block que a subnet pub 1B irá usar"
  default = "10.0.102.0/24"
}

variable "vpc_sn_pub_map_public_ip_on_launch" {
    type    = bool
    default = true
}

variable "sn_vpc_gsi_priv_1a_cidr" {
  description = "Declaração do ip e cidr block que a subnet priv 1A irá usar"
  default = "10.0.1.0/24"
}

variable "sn_vpc_gsi_priv_1b_cidr" {
  description = "Declaração do ip e cidr block que a subnet priv 1B irá usar"
  default = "10.0.2.0/24"
}

variable "sn_vpc_gsi_priv_2a_cidr" {
  description = "Declaração do ip e cidr block que a subnet priv 1A irá usar"
  default = "10.0.3.0/24"
}

variable "sn_vpc_gsi_priv_2b_cidr" {
  description = "Declaração do ip e cidr block que a subnet priv 1B irá usar"
  default = "10.0.4.0/24"
}