/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ 
Issue Date       | Revision | Author | Content                                             |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of EKS Control Plane Resource   |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

/*
This file contains the source for displaying the value of provisioning resources at terminal after execution 
as well as saving it for utilization in other modules.
*/

//Output of EKS Control Plane Name
output "eks_clstr_name" {
  value = aws_eks_cluster.eks_oran.name
}

//Output of EKS Control Plane Endpoint
output "API_SERVER_URL" {
  value = aws_eks_cluster.eks_oran.endpoint
}

//Output of EKS Control Plane Service CIDR
output "K8S_CLUSTER_DNS_IP" {
  value = aws_eks_cluster.eks_oran.kubernetes_network_config[0].service_ipv4_cidr
}

//Output of EKS Control Plane Certificate Authority
output "B64_CLUSTER_CA" {
  value = aws_eks_cluster.eks_oran.certificate_authority[0].data
}

//Output of EKS Control Plane Cluster Security Group
output "eks_clstr_sg" {
  value = aws_eks_cluster.eks_oran.vpc_config[0].cluster_security_group_id
}

