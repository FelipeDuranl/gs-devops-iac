# VPC

resource "aws_vpc" "vpc_iac" {
  cidr_block           = "${var.vpc_iac_cidr}"
  enable_dns_hostnames = "${var.vpc_iac_dns_hostname}"
  enable_dns_support =  "${var.vpc_iac_dns_support}"

  tags = {
    "Name" = "vpc-iac"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw_vpc_iac" {
  vpc_id = aws_vpc.vpc_iac.id

  tags = {
    "Name" = "igw_vpc_iac"
  }
}





# Tabela de roteamento Pública

resource "aws_route_table" "vpc_iac_route_table_pub" {
    vpc_id = aws_vpc.vpc_iac.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_vpc_iac.id
    }

    tags = {
        Name = "vpc_iac_route_table_pub"
    }
}

# Tabela de roteamento Privada

resource "aws_route_table" "vpc_iac_route_table_priv" {
    vpc_id = aws_vpc.vpc_iac.id

    tags = {
        Name = "vpc_iac_route_table_priv"
    }
}





# Subnet Pública US-EAST-1A

resource "aws_subnet" "sn_vpc_iac_pub_1a" {
  vpc_id                  = aws_vpc.vpc_iac.id
  cidr_block              = "${var.sn_vpc_iac_pub_1a_cidr}"
  map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = "sn_vpc_iac_pub_1a"
  }
}

# Associação da Subnet Pública 1A
resource "aws_route_table_association" "association_pub_1a" {
  subnet_id      = aws_subnet.sn_vpc_iac_pub_1a.id
  route_table_id = aws_route_table.vpc_iac_route_table_pub.id
}





# Criação da Subnet Pública US-EAST-1B

resource "aws_subnet" "sn_vpc_iac_pub_1b" {
  vpc_id                  = aws_vpc.vpc_iac.id
  cidr_block              = "${var.sn_vpc_iac_pub_1b_cidr}"
  map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
  availability_zone       = "us-east-1b"

  tags = {
    "Name" = "sn_vpc_iac_pub_1b"
  }
}

# Associação da Subnet Pública 1B
resource "aws_route_table_association" "association_pub_1b" {
  subnet_id      = aws_subnet.sn_vpc_iac_pub_1b.id
  route_table_id = aws_route_table.vpc_iac_route_table_pub.id
}





# Criação da Subnet Privada US-EAST-1A

resource "aws_subnet" "sn_vpc_iac_priv_1a" {
  vpc_id                  = aws_vpc.vpc_iac.id
  cidr_block              = "${var.sn_vpc_iac_priv_1a_cidr}"
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = "sn_vpc_iac_priv_1a"
  }
}

# Associação da Subnet Privada 1A
resource "aws_route_table_association" "association_priv_1a" {
  subnet_id      = aws_subnet.sn_vpc_iac_priv_1a.id
  route_table_id = aws_route_table.vpc_iac_route_table_priv.id
}





# Criação da Subnet Privada US-EAST-1B

resource "aws_subnet" "sn_vpc_iac_priv_1b" {
  vpc_id                  = aws_vpc.vpc_iac.id
  cidr_block              = "${var.sn_vpc_iac_priv_1b_cidr}"
  availability_zone       = "us-east-1b"

  tags = {
    "Name" = "sn_vpc_iac_priv_1b"
  }
}

# Associação da Subnet Privada 1B
resource "aws_route_table_association" "association_priv_1b" {
  subnet_id      = aws_subnet.sn_vpc_iac_priv_1b.id
  route_table_id = aws_route_table.vpc_iac_route_table_priv.id
}


# Criação da Subnet Privada 2 US-EAST-1A

resource "aws_subnet" "sn_vpc_iac_priv2_1a" {
  vpc_id                  = aws_vpc.vpc_iac.id
  cidr_block              = "${var.sn_vpc_iac_priv2_1a_cidr}"
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = "sn_vpc_iac_priv2_1a"
  }
}

# Associação da Subnet Privada 1A
resource "aws_route_table_association" "association_priv2_1a" {
  subnet_id      = aws_subnet.sn_vpc_iac_priv2_1a.id
  route_table_id = aws_route_table.vpc_iac_route_table_priv.id
}





# Criação da Subnet Privada 2 US-EAST-1B

resource "aws_subnet" "sn_vpc_iac_priv2_1b" {
  vpc_id                  = aws_vpc.vpc_iac.id
  cidr_block              = "${var.sn_vpc_iac_priv2_1b_cidr}"
  availability_zone       = "us-east-1b"

  tags = {
    "Name" = "sn_vpc_iac_priv2_1b"
  }
}

# Associação da Subnet Privada 1B
resource "aws_route_table_association" "association_priv2_1b" {
  subnet_id      = aws_subnet.sn_vpc_iac_priv2_1b.id
  route_table_id = aws_route_table.vpc_iac_route_table_priv.id
}




# Criação do Security Group Pública

resource "aws_security_group" "vpc_iac_security_group_pub" {
  name        = "vpc_iac_security_group_pub"
  description = "vpc iac Security Group pub"
  vpc_id      = aws_vpc.vpc_iac.id

  egress {
      description = "All to All"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      description = "All from 10.0.0.0/16"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
      description = "TCP/22 from all"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      description = "TCP/80 from all"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc iac Security Group pub"
  }
}


#Security Group privado

resource "aws_security_group" "vpc_iac_security_group_priv" {
  name        = "vpc_iac_security_group_priv"
  description = "vpc iac Security Group priv"
  vpc_id      = aws_vpc.vpc_iac.id

  ingress {
      description = "All from 10.0.0.0/16"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
      description = "All to all"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

}

