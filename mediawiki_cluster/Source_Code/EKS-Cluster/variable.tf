/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ 
Issue Date       | Revision | Author | Content                                             |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of EKS Control Plane Resource   |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This file contains the source code of variable type used in main.tf file.

##=============================================##
##############Tags of All resources##############
##=============================================##

variable "default_tags" {
  type        = map
  description = "Map of Default Tags"
}

variable "eks_clstr" {
  type        = string
  description = "Name of EKS Cluster"
}

variable "eks_clstr_ver" {
  type        = string
  description = "Version of EKS Cluster"
}
