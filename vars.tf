variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "eu-central-1"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "172.31.0.0/16"
}

variable "public_subnet_cidr_1a" {
    description = "CIDR for the Public Subnet in 1a"
    default = "172.31.80.0/20"
}

variable "private_subnet_cidr_1a" {
    description = "CIDR for the Private Subnet in 1a"
    default = "172.31.48.0/20"
}

variable "public_subnet_cidr_1b" {
    description = "CIDR for the Public Subnet in 1b"
    default = "172.31.0.0/20"
}

variable "private_subnet_cidr_1b" {
    description = "CIDR for the Private Subnet in 1b"
    default = "172.31.16.0/20"
}

variable "public_subnet_cidr_1c" {
    description = "CIDR for the Public Subnet in 1c"
    default = "172.31.64.0/20"
}

variable "private_subnet_cidr_1c" {
    description = "CIDR for the Private Subnet in 1c"
    default = "172.31.32.0/20"
}
