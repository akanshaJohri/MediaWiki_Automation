/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ 
Issue Date       | Revision | Author | Content                                             |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of EKS Control Plane Resource   |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

##This file is a variable file which contains the End User Input. User can update the data according to the use cases.

//Global Tags which applied for all EKS Resource
default_tags = {
    Service = "Automation"
    ManagedBy = "Terraform"
    Team = "Public Cloud Team"
}

//Name of EKS Cluster 
eks_clstr = "Auto-EKS-ORAN"

//Version of EKS Cluster
eks_clstr_ver = "1.21"

