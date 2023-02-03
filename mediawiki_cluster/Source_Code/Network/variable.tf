/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Network Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This file contains the source code of variable type used in main.tf file.

##=============================================##
##############Tags of All resources##############
##=============================================##

variable "default_tags" {
  type        = map
  description = "Map of Default Tags"
}

##=======================================##
##############Variable of VPC##############
##=======================================##
variable "vpc_cidr_block" {
  type = string
  description = "Provide the CIDR Block of VPC"
}

variable "vpc_cidr_block_tags" {
  type = string
  description = "Provide the Name of VPC"
}

##==========================================##
##############Variable of Subnet##############
##==========================================##
variable "private-01-cidr_block" {
  type = string
  description = "Provide the CIDR of private Subnet-01"
}

variable "private-01-AZ" {
  type = string
  description = "Provide the availability zone of private Subnet-01"
}

variable "private-01-cidr_block_tags" {
  type = string
  description = "Provide the Name of private Subnet-01"
}

variable "private-02-cidr_block" {
  type = string
  description = "Provide the CIDR of private Subnet-02"
}

variable "private-02-AZ" {
  type = string
  description = "Provide the availability zone of private Subnet-02"
}

variable "private-02-cidr_block_tags" {
  type = string
  description = "Provide the Name of private Subnet-02"
}

variable "public-01-cidr_block" {
  type = string
  description = "Provide the CIDR of public Subnet-01"
}

variable "public-01-AZ" {
  type = string
  description = "Provide the Availability zone of public Subnet-01"
}

variable "public-01-cidr_block_tags" {
  type = string
  description = "Provide the Name of public Subnet-01"
}

##=================================================##
##############Variable Internet Gateway##############
##=================================================##
variable "internet_gateway_tags" {
  type = string
  description = "Provide the Name of aws_internet_gateway"
}

##======================================================##
##############Variable of Public Route Table##############
##======================================================##
variable "rt_pub_tags" {
  type = string
  description = "Provide the Name of RouteTable Public"
}

##=======================================================##
##############variable of Private Route Table##############
##=======================================================##
variable "rt_priv_tags" {
  type = string
  description = "Provide the Name of Private Route Table"
}

##===================================================##
##############variable of Security Group ##############
##===================================================##
variable "cntrl_pln_sg_tags" {
  type = string
  description = "Provide the Name of Control Plane Security Group"
}

variable "wrkr_nd_sg_tags" {
  type = string
  description = "Provide the Name of Worker Node Security Group"
}

variable "bastion_nd_sg_tags" {
  type = string
  description = "Provide the Name of Bastion Node Security Group"
}

variable "endpoint_sg_tags" {
  type = string
  description = "Provide the Name of Endpoint Security Group"
}

##============================================##
##############Variable of Endpoint##############
##============================================##
variable "ec2_ep_intrfc_tags" {
  type = string
  description = "Provide the name of EC2 Endpoint Interface"
}

variable "sts_ep_intrfc_tags" {
  type = string
  description = "Provide the name of STS Endpoint Interface"
}

variable "ecr_dkr_ep_intrfc_tags" {
  type = string
  description = "Provide the name of ECR DKR Endpoint Interface"
}

variable "ecr_api_ep_intrfc_tags" {
  type = string
  description = "Provide the name of ECR API Endpoint Interface"
}

variable "s3_ep_gw_tags" {
  type = string
  description = "Provide the name of S3 Endpoint Gateway"
}
