
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
    source                = "./modules/VPC"
    vpc_cidr              = "${var.vpc_cidr}"
    vpc_sn_aws1            = "${var.vpc_sn_aws1}"
    vpc_sn_aws2            = "${var.vpc_sn_aws2}"
    vpc_sn_aws1_pub_cidr   = "${var.vpc_sn_aws1_pub_cidr}"
    vpc_sn_aws2_pub_cidr   = "${var.vpc_sn_aws2_pub_cidr}"
    vpc_sn_aws1_priv1_cidr = "${var.vpc_sn_aws1_priv1_cidr}"
    vpc_sn_aws2_priv1_cidr = "${var.vpc_sn_aws2_priv1_cidr}"
    vpc_sn_aws1_priv2_cidr = "${var.vpc_sn_aws1_priv2_cidr}"
    vpc_sn_aws2_priv2_cidr = "${var.vpc_sn_aws2_priv2_cidr}"
}


