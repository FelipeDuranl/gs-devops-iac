variable "vpc_id" {}

#Load Balancer

variable "protocol" {
  type = string
  default = "HTTP"
}

variable "port" {
  type = number
  default = 80
}

variable "sn_aws1_pub_id" {}

variable "sn_aws1_pub_id" {}

variable "vpc_sn_aws2_pub_id" {}

variable "ami" {
  type    = string
  default = "ami-02e136e904f3da870"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#Auto Scaling
variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 4
}

variable "ec2_lb_listener_action_type" {
    type    = string
    default = "forward"
}