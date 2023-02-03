/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ __ _ _ _ __ _ _
Issue Date       | Revision | Author | Content                                                                  |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of worker node template & EKS nodegroup Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|

*/

## This file contains the source code of variable type used in main.tf file.

##=============================================##
##############Tags of All resources##############
##=============================================##

variable "default_tags" {
  type        = map
  description = "Map of Default Tags"
}

##=========================================================##
##############variable of Worker Node Template###############
##=========================================================##

variable "tmplt_name" {
  type = string
  description = "Provide the Template name"
}

variable "tmplt_ami" {
  type = string
  description = "Provide the AMI of Worker Node"
}

variable "tmplt_inst_type" {
  type = string
  description = "Provide the instance type of Worker Node"
}

variable "tmplt_key_pair" {
  type = string
  description = "Provide the key-pair name to login to workernode"
}

variable "ebs_vol_sz" {
  type = number
  description = "Provide the ebs volume size"
}

variable "ebs_vol_type" {
  type = string
  description = "Provide the ebs volume type"
}

##==================================================##
##############variable of EKS NodeGroup###############
##==================================================##
variable "eks_ndgrp" {
  type = string
  description = "Provide the EKS Nodegroup Name"
}

variable "eks_cpcty" {
  type = string
  description = "Provide the Capcity Type"
}

variable "lbl_selctr" {
  type        = map
  description = "Map of label & Selector"
}

variable "scl_dsrd_sz" {
  type        = number
  description = "Provide the desired wokernode should be available in nodegroup"
}

variable "scl_mx_sz" {
  type        = number
  description = "Provide the maximum wokernode should be present in nodegroup"
}

variable "scl_mn_sz" {
  type        = number
  description = "Provide the minimum wokernode should be present in nodegroup"
}
