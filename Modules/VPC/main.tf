resource "aws_vpc" "vpc_gsi" {
  cidr_block           = "${var.vpc_gsi_cidr}"
  enable_dns_hostnames = "${var.vpc_gsi_dns_hostname}"
  enable_dns_support =  "${var.vpc_gsi_dns_support}"

  tagsi = {
    "Name" = "vpc-gsi"
  }
}

resource "aws_internet_gateway" "igw_vpc_gsi" {
  vpc_id = aws_vpc.vpc_gsi.id

  tagsi = {
    "Name" = "igw_vpc_gsi"
  }
}

resource "aws_route_table" "vpc_gsi_route_table_pub" {
    vpc_id = aws_vpc.vpc_gsi.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_vpc_gsi.id
    }

    tagsi = {
        Name = "vpc_gsi_route_table_pub"
    }
}

resource "aws_route_table" "vpc_gsi_route_table_priv" {
    vpc_id = aws_vpc.vpc_gsi.id

    tagsi = {
        Name = "vpc_gsi_route_table_priv"
    }
}

resource "aws_subnet" "sn_vpc_gsi_pub_1a" {
  vpc_id                  = aws_vpc.vpc_gsi.id
  cidr_block              = "${var.sn_vpc_gsi_pub_1a_cidr}"
  map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
  availability_zone       = "us-east-1a"

  tagsi = {
    "Name" = "sn_vpc_gsi_pub_1a"
  }
}

resource "aws_route_table_association" "association_pub_1a" {
  subnet_id      = aws_subnet.sn_vpc_gsi_pub_1a.id
  route_table_id = aws_route_table.vpc_gsi_route_table_pub.id
}

resource "aws_subnet" "sn_vpc_gsi_pub_1b" {
  vpc_id                  = aws_vpc.vpc_gsi.id
  cidr_block              = "${var.sn_vpc_gsi_pub_1b_cidr}"
  map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
  availability_zone       = "us-east-1b"

  tagsi = {
    "Name" = "sn_vpc_gsi_pub_1b"
  }
}

resource "aws_route_table_association" "association_pub_1b" {
  subnet_id      = aws_subnet.sn_vpc_gsi_pub_1b.id
  route_table_id = aws_route_table.vpc_gsi_route_table_pub.id
}

resource "aws_subnet" "sn_vpc_gsi_priv_1a" {
  vpc_id                  = aws_vpc.vpc_gsi.id
  cidr_block              = "${var.sn_vpc_gsi_priv_1a_cidr}"
  availability_zone       = "us-east-1a"

  tagsi = {
    "Name" = "sn_vpc_gsi_priv_1a"
  }
}

resource "aws_route_table_association" "association_priv_1a" {
  subnet_id      = aws_subnet.sn_vpc_gsi_priv_1a.id
  route_table_id = aws_route_table.vpc_gsi_route_table_priv.id
}

resource "aws_subnet" "sn_vpc_gsi_priv_2a" {
  vpc_id                  = aws_vpc.vpc_gsi.id
  cidr_block              = "${var.sn_vpc_gsi_priv_2a_cidr}"
  availability_zone       = "us-east-1a"

  tagsi = {
    "Name" = "sn_vpc_gsi_priv_2a"
  }
}

resource "aws_route_table_association" "association_priv_2a" {
  subnet_id      = aws_subnet.sn_vpc_gsi_priv_2a.id
  route_table_id = aws_route_table.vpc_gsi_route_table_priv.id
}

resource "aws_subnet" "sn_vpc_gsi_priv_1b" {
  vpc_id                  = aws_vpc.vpc_gsi.id
  cidr_block              = "${var.sn_vpc_gsi_priv_1b_cidr}"
  availability_zone       = "us-east-1b"

  tagsi = {
    "Name" = "sn_vpc_gsi_priv_1b"
  }
}

resource "aws_route_table_association" "association_priv_1b" {
  subnet_id      = aws_subnet.sn_vpc_gsi_priv_1b.id
  route_table_id = aws_route_table.vpc_gsi_route_table_priv.id
}


resource "aws_subnet" "sn_vpc_gsi_priv_2b" {
  vpc_id                  = aws_vpc.vpc_gsi.id
  cidr_block              = "${var.sn_vpc_gsi_priv_2b_cidr}"
  availability_zone       = "us-east-1b"

  tagsi = {
    "Name" = "sn_vpc_gsi_priv_2b"
  }
}

resource "aws_route_table_association" "association_priv_2b" {
  subnet_id      = aws_subnet.sn_vpc_gsi_priv_2b.id
  route_table_id = aws_route_table.vpc_gsi_route_table_priv.id
}

resource "aws_security_group" "vpc_gsi_security_group_pub" {
  name        = "vpc_gsi_security_group_pub"
  description = "vpc gsi Security Group pub"
  vpc_id      = aws_vpc.vpc_gsi.id

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

  tagsi = {
    Name = "vpc gsi Security Group pub"
  }
}

resource "aws_security_group" "vpc_gsi_security_group_priv" {
  name        = "vpc_gsi_security_group_priv"
  description = "vpc gsi Security Group priv"
  vpc_id      = aws_vpc.vpc_gsi.id

  ingress {
      description = "All from 10.0.0.0/16"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
      description = "TCP/22 from 10.0.0.0/16"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
  }


  ingress {
      description = "TCP/80 from 10.0.0.0/16"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
      description = "All to 10.0.0.0/16"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.0.0.0/16"]
  }

}
