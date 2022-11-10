
# Configuração do Bloco de Terraform

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0" /* Opcional, porém recomendado para ambiente de produção */
    }
  }
}

# Configuração da região utilizada na AWS
provider "aws" {
  region = var.region_aws
}


/*-------------------------------------------
                 VPC Modules                
-------------------------------------------*/

# MODULES ORCHESTRATOR

module "VPC" {
  source  = "./Modules/VPC"
  # vpc_cidr              = "${var.vpc_cidr}"
  # vpc_sn_aws1            = "${var.vpc_sn_aws1}"
  # vpc_sn_aws2            = "${var.vpc_sn_aws2}"
  # vpc_sn_aws1_pub_cidr   = "${var.vpc_sn_aws1_pub_cidr}"
  # vpc_sn_aws2_pub_cidr   = "${var.vpc_sn_aws2_pub_cidr}"
  # vpc_sn_aws1_priv1_cidr = "${var.vpc_sn_aws1_priv1_cidr}"
  # vpc_sn_aws2_priv1_cidr = "${var.vpc_sn_aws2_priv1_cidr}"
  # vpc_sn_aws1_priv2_cidr = "${var.vpc_sn_aws1_priv2_cidr}"
  # vpc_sn_aws2_priv2_cidr = "${var.vpc_sn_aws2_priv2_cidr}"
}

module "CAMADA1" {
  source  = "./Modules/CAMADA1"
  vpc_id = "${module.VPC.vpc_iac_id}"
  # rds_endpoint = "${module.RDS.rds_endpoint}"
  # rds_name = "${var.rds_name}"
  # rds_user = "${var.rds_user}"
  # rds_password = "${var.rds_password}"
  sn_aws1_pub_id = "${module.VPC.sn_aws1_pub_id}"
  sn_aws2_pub_id = "${module.VPC.sn_aws2_pub_id}"
  vpc_sg_pub_id = "${vpc_sn_aws2_pub_id}"
}


