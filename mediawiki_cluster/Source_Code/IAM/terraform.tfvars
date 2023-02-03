/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of IAM Resource         |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

##In this file end user can update the value of variable as per the use cases.

//Global Tags which applied for all IAM Resource
default_tags = {
    Service = "Automation"
    ManagedBy = "Terraform"
    Team = "Public Cloud Team"
}

//Name & Tag of IAM User
iam_user = "Auto_NEC_NOI_PC_Team"

//Name & Tag IAM User Policy
iam_user-policy = "Auto_ORAN_NECI_User_Policy"

//Tag IAM User Policy attached to IAM User
iam_user-policy-attachment = "Auto-IAM-user-policy-attach"

//Name & Tag EKS Cluster Role
iam_role_eks = "Auto_ORAN_NECI_EKS_Cluster"

//Name & Tag EKS Worker Node Role
iam_role_wrkr = "Auto_ORAN_NECI_EKS_WorkerNode"

//Name & Tag Cloudformation Role
iam_role_Cloudformation = "Auto_ORAN_NECI_EKS_Cloudformation"

//Name & Tag Bastion Host Role
iam_role_Bastion_host = "Auto_ORAN_NECI_Bastion_Host"

//Name & Tag EC2 Role
ec2_user_role = "Auto_User_NECI_NOI_PC"
