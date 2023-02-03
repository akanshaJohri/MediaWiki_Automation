/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Network Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This file contains the source code of Terraform provider, the backend tfstate file.

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
//Local Backend storage
    path = "../../Tfstate_file/Network/terraform.tfstate"
  }
}
