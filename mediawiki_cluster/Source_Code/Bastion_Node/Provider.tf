/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                      |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _| _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Bastion Resource      |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _| _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

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

//provider version
      version = "4.25.0"
    }
  }
}


##=======================================================##
##############terraform tfstate file location##############
##=======================================================##

terraform {
  backend "local" {
//Local Backend Storage
    path = "../../Tfstate_file/Bastion_Node/terraform.tfstate"
  }
}

##===========================================================##
##############Data Source from Network State File##############
##===========================================================##

data "terraform_remote_state" "nest_tfst" {
  backend = "local"

  config = {
//Data Source of Network tfstate file
    path = "../../Tfstate_file/Network/terraform.tfstate"
  }
}

