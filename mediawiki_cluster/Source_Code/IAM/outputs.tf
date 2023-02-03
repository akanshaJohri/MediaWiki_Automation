/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of IAM Resource         |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

/*
This file contains the source code for displaying the value of provisioning resources at terminal after execution 
as well as saving it for utilization in other modules like EKS Cluster.
*/

//output of IAM ARN Value of EKS Cluster
output "iam_rl_EKS_Clstr" {
    value = aws_iam_role.EKS_Cluster.arn
    description = "ARN of EKS Cluster Role"
}

//output of IAM ARN Value of Worker Node
output "iam_rl_wrkr" {
    value = aws_iam_role.eks-wrkr-node.arn
    description = "ARN of EKS Worker Node Role"
}
