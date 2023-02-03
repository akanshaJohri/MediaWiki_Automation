/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of IAM Resource         |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This file contains the data type of each variable i.e. map, string, number etc.

##=============================================##
##############Tags of All resources##############
##=============================================##

variable "default_tags" {
  type        = map
  description = "Map of Default Tags "
}

##=================================================================##
##############data type data type Variables of IAM User##############
##=================================================================##

variable "iam_user" {
  type = string
  description = "Provide the name of IAM User"
}

##=========================================================##
##############data type Variable of User Policy##############
##=========================================================##

variable "iam_user-policy" {
  type = string
  description = "Provide a policy name for the IAM User"
}

##=====================================================================##
##############data type Variable of User Policy Attachment ##############
##=====================================================================##
variable "iam_user-policy-attachment" {
  type = string
  description = "Provide the name of User_Policy Attachment to IAM User"
}

##=======================================================================##
##############data type Variable of IAM Role for EKS Cluster ##############
##=======================================================================##

variable "iam_role_eks" {
  type = string
  description = "Provide the name of IAM Role for EKS Cluster"
}

##==========================================================================##
##############data type Variable of IAM Role for EKS WorkerNode ##############
##==========================================================================##

variable "iam_role_wrkr" {
  type = string
  description = "Provide the name of IAM Role for EKS WorkerNode"
}

##==========================================================================##
##############data type variable of IAM Role for CloudFormation ##############
##==========================================================================##

variable "iam_role_Cloudformation" {
  type = string
  description = "Provide the name of IAM Role for Cloudformation"
}

##========================================================================##
##############data type variable of IAM Role for Bastion Host ##############
##========================================================================##

variable "iam_role_Bastion_host" {
  type = string
  description = "Provide the name of IAM Role for Bastion Host(EC2)"      
}

##===============================================================##
##############data type variable of IAM Role for EC2 ##############
##===============================================================##

variable "ec2_user_role" {
  type = string
  description = "Provide the name of IAM Role for EC2"      
}
