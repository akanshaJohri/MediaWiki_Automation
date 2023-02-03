/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ __ _ _ _ __ _ _
Issue Date       | Revision | Author | Content                                                                  |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|
06th Dec 2022    |  1.0     |  NECI  | Initial Source Code of worker node template & EKS nodegroup Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _|

*/

## This File contains the source Code for provisioning/decommissioning of workde node temlate & AWS EKS Nodegroup resource.

##===================================================##
##############Creation of Launch Template##############
##===================================================##

resource "aws_launch_template" "eks_wrkr_lnch_tmplt" {

  //Name of worker node template
  name = var.tmplt_name

  //AMI Id of template
  image_id = var.tmplt_ami

  //Security Group of EKS Cluster
  vpc_security_group_ids = ["${data.terraform_remote_state.eks_clstr_tfst.outputs.eks_clstr_sg}"]

  //Instancy Type
  instance_type = var.tmplt_inst_type

  //Key-pair name to login the Instance
  key_name = var.tmplt_key_pair

  //Userdata to customize the kubelet configuration file in worker node
  user_data = filebase64("${path.module}/customization.sh")

  //Disk name, type & size of Block Storage
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.ebs_vol_sz
      volume_type = var.ebs_vol_type
    }
  }

  depends_on = [
    data.terraform_remote_state.network_tfst,
    data.terraform_remote_state.eks_clstr_tfst
  ]
}


##==================================================##
##############Creation of EKS Workernode ##############
##==================================================##

resource "aws_eks_node_group" "eks_nodegroup" {
  cluster_name    = "${data.terraform_remote_state.eks_clstr_tfst.outputs.eks_clstr_name}"
  node_group_name = var.eks_ndgrp
  node_role_arn   = "${data.terraform_remote_state.iam_tfst.outputs.iam_rl_wrkr}"
  subnet_ids      = ["${data.terraform_remote_state.network_tfst.outputs.prvt_sub_01}", "${data.terraform_remote_state.network_tfst.outputs.prvt_sub_02}"]
  capacity_type  = var.eks_cpcty
  labels = var.lbl_selctr

  scaling_config {
    desired_size = var.scl_dsrd_sz
    max_size     = var.scl_mx_sz
    min_size     = var.scl_mn_sz
  }

  update_config {
    max_unavailable = 1
  }

  launch_template {
    id = aws_launch_template.eks_wrkr_lnch_tmplt.id
    version = aws_launch_template.eks_wrkr_lnch_tmplt.latest_version
  }

  depends_on = [
    data.terraform_remote_state.iam_tfst,
    data.terraform_remote_state.network_tfst,
    data.terraform_remote_state.eks_clstr_tfst,
    aws_launch_template.eks_wrkr_lnch_tmplt
  ]

  tags = merge(var.default_tags, {
    Name = "${var.eks_ndgrp}"
    },
  )

}

