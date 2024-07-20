data "aws_ssm_parameter" "vpc_id" {
  name = "/linuxtips-vpc/vpc/vpc_id"
}

data "aws_ssm_parameter" "alb" {
  name = "/linuxtips/ecs/lb/id"
}

data "aws_ssm_parameter" "listener" {
  name = "/linuxtips/ecs/lb/listerner"
}

data "aws_ssm_parameter" "private_subnet_1" {
  name = "/linuxtips-vpc/vpc/subnet_private_1a"
}

data "aws_ssm_parameter" "private_subnet_2" {
  name = "/linuxtips-vpc/vpc/subnet_private_1b"
}

data "aws_ssm_parameter" "private_subnet_3" {
  name = "/linuxtips-vpc/vpc/subnet_private_1c"
}

data "aws_ssm_parameter" "service_discovery_namespace" {
  name = "/linuxtips/ecs/cloudmap/namespace"
}