/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Bastion Resource     |
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

##=====================================================================##
##############variable of Keypair of Bastion Host Instance###############
##=====================================================================##
variable "name_kp" {
  type = string
  description = "Provide the Key Pair Name"
}

variable "public_key_kp" {
  type = string
  description = "Provide the Public Key used for login access to Bastion Host"
}

##================================================##
##############Variable of Bastion Node##############
##================================================##
variable "ami_bastion" {
  type = string
  description = "Provide the AMI ID of bastion Node"
}

variable "inst_type_bastion" {
  type = string
  description = "Provide the Instance Type of bastion Node"
}

variable "bastion_tag" {
  type = string
  description = "Provide the Name of bastion Node"
}

//Root Block Storage
variable "sz_root_blk_storage" {
  type = string
  description = "Provide the size of Rook Block Storage in GB"
}
variable "type_root_blk_storage" {
  type = string
  description = "Provide the type of Rook Block Storage"
}