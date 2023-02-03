
/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ 
Issue Date       | Revision | Author | Content                                             |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of EKS Control Plane Resource   |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This file contains the source code of Terraform provider, the backend tfstate file and data source of remote state file

##============================================##
##############Terraform Provider ##############
##============================================##

terraform {
  required_providers {
    aws = {
//provider name
      source = "hashicorp/aws"
// provider version
      version = "4.25.0"
    }
  }
}

##=======================================================##
##############terraform tfstate file location##############
##=======================================================##

terraform {
  backend "local" {
//Local backend storage path
    path = "../../Tfstate_file/EKS-Cluster/terraform.tfstate"
  }
}

##===========================================================##
##############Data Source from Network State File##############
##===========================================================##

data "terraform_remote_state" "network_tfst" {
  backend = "local"

  config = {
//Data Source of Network tfstate file
    path = "../../Tfstate_file/Network/terraform.tfstate"
  }
}

##===============================================================##
##############Data Source from IAM Network State File##############
##===============================================================##

data "terraform_remote_state" "iam_tfst" {
  backend = "local"

  config = {
//Data Source of Network tfstate file
    path = "../../Tfstate_file/IAM/terraform.tfstate"
  }
}
