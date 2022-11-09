
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

module "VPC" {
  source  = "./Modules/VPC"
}

module "RDS" {
  source  = "./Modules/RDS"
  sn_vpc_iac_pub2_1a_id = "${module.VPC.sn_vpc_iac_pub2_1a_id}"
  sn_vpc_iac_pub2_1b_id = "${module.VPC.sn_vpc_iac_pub2_1b_id}"
  vpc_iac_security_group_priv_id = "${module.VPC.vpc_iac_security_group_priv_id}"

}  


