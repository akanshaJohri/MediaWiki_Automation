/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ __ _ _ _ __ _ _
Issue Date       | Revision | Author | Content                                                                  |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of worker node template & EKS nodegroup Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|

*/

/*
This file contains the source for displaying the value of provisioning resources at terminal after execution 
as well as saving it for utilization in other modules.
*/


//Output of template ID
output "template_id" {
  value = aws_launch_template.eks_wrkr_lnch_tmplt.id
}

//Output of Template version 
output "template_vers" {
  value = aws_launch_template.eks_wrkr_lnch_tmplt.latest_version
}

//EKS Nodegroup ID
output "eks_ndgrp_instnc_id" {
  value = aws_eks_node_group.eks_nodegroup.id
}
