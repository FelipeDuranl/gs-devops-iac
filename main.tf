
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
}

module "CAMADA1" {
  source  = "./Modules/CAMADA1"
  vpc_id = "${module.VPC.vpc_iac_id}"
  # rds_endpoint = "${module.RDS.rds_endpoint}"
  # rds_name = "${var.rds_name}"
  # rds_user = "${var.rds_user}"
  # rds_password = "${var.rds_password}"
  sn_vpc_iac_pub_1a_id = "${module.VPC.sn_vpc_iac_pub_1a_id}"
  sn_vpc_iac_pub_1b_id = "${module.VPC.sn_vpc_iac_pub_1b_id}"
  vpc_iac_security_group_pub_id = "${module.VPC.vpc_iac_security_group_pub_id}"
}


