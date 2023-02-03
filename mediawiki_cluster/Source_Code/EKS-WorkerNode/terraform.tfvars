/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ __ _ _ _ __ _ _
Issue Date       | Revision | Author | Content                                                                  |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of worker node template & EKS nodegroup Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|

*/

##This file is a variable file which contains the End User Input. User can update the data according to the use cases.

//Global Tags which applied for all EKS Resource
default_tags = {
    Service = "Automation"
    ManagedBy = "Terraform"
    Team = "Public Cloud Team"
}

//Name of Template used for Worker Node
tmplt_name = "EKS_Lunched_Template"

//AMI ID in template used for Worker Node
tmplt_ami = "ami-065e0db5b710c2eae"

//Instance Type in Template used for Worker Node
tmplt_inst_type = "c5.4xlarge"

//Key-pair name in Template used for logging into workernode
tmplt_key_pair = "Bastion_host_keypair"

//EBS Volume Size
ebs_vol_sz = 20

//EBS Volume Type
ebs_vol_type = "gp2"

//Name of EKS Nodegroup
eks_ndgrp = "Auto-EKS-Nodegroup"

//Capacity Type in EKS Nodegroup
eks_cpcty = "ON_DEMAND"

//EKS nodegroup Label & Selector
lbl_selctr = {
  Application= "CUCP"
}

//Desired wokernode should be available in nodegroup
scl_dsrd_sz = 1

//Maximum wokernode should be present in nodegroup
scl_mx_sz = 2

//Minimum wokernode should be present in nodegroup
scl_mn_sz = 1


