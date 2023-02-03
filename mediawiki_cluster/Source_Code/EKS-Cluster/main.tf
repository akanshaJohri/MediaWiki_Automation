/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ 
Issue Date       | Revision | Author | Content                                             |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of EKS Control Plane Resource   |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This File contains the source Code for provisioning/decommissioning of AWS EKS Control Plane resource

##======================================================##
##############Creation of EKS Control Plane ##############
##======================================================##

resource "aws_eks_cluster" "eks_oran" {

  //Name of EKS Control Plane
  name     = var.eks_clstr

  //IAM Role assigned to EKS Control Plane
  role_arn = "${data.terraform_remote_state.iam_tfst.outputs.iam_rl_EKS_Clstr}"

  //Version of EKS Control plane
  version  = var.eks_clstr_ver

  //Netwing of EKS Control plane
  vpc_config {

    //Subnet assigned to EKS Control Plane
    subnet_ids = ["${data.terraform_remote_state.network_tfst.outputs.prvt_sub_01}", "${data.terraform_remote_state.network_tfst.outputs.prvt_sub_02}"]
    //EKS Control plane can be accessible privately
    endpoint_private_access = true

    //EKS Control Plane restricted to Public Access
    endpoint_public_access = false

    //Security Group assigned to EKS Control Plane
    security_group_ids = ["${data.terraform_remote_state.network_tfst.outputs.ControlPlane_SG}"]
  }

  depends_on = [
    data.terraform_remote_state.network_tfst,
    data.terraform_remote_state.iam_tfst
  ]

  tags = merge(var.default_tags, {
    Name = "${var.eks_clstr}"
    },
  )
}

##=========================================================##
##############Update of Cluster Security Group ##############
##=========================================================##

resource "aws_security_group_rule" "Additinal_EKS_Security_Group" {
    //Allowing SSH port of EKS Cluster Security Group
    type = "ingress"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${data.terraform_remote_state.network_tfst.outputs.vpc_cidr_block}"]
    security_group_id = aws_eks_cluster.eks_oran.vpc_config[0].cluster_security_group_id
}

