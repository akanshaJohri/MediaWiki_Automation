/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of IAM Resource         |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This file contains the source Code for provisioning/decommissioning of AWS IAM resource i.e User, Role, Policy etc

##============================================##
##############Creation of IAM User##############
##============================================##

resource "aws_iam_user" "iam_username" {
// IAM User Name
  name = var.iam_user
  path = "/system/"

  tags = merge(var.default_tags, {
    Name = "${var.iam_user}"
    },
  )
}

##===============================================##
##############Creation of User Policy##############
##===============================================##

resource "aws_iam_policy" "user-policy" {
//IAM User Policy Name
  name        = var.iam_user-policy
  path        = "/"
  description = "Creation of User_Policy"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:GetPolicyVersion",
                "iam:GetAccountPasswordPolicy",
                "iam:ListRoleTags",
                "iam:ListServerCertificates",
                "iam:GenerateServiceLastAccessedDetails",
                "iam:CreateRole",
                "iam:AttachRolePolicy",
                "iam:ListServiceSpecificCredentials",
                "iam:PutRolePolicy",
                "autoscaling:*",
                "iam:ListSigningCertificates",
                "iam:ListVirtualMFADevices",
                "iam:AddRoleToInstanceProfile",
                "iam:ListSSHPublicKeys",
                "iam:SimulateCustomPolicy",
                "iam:SimulatePrincipalPolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListOpenIDConnectProviderTags",
                "iam:ListSAMLProviderTags",
                "ebs:*",
                "iam:ListRolePolicies",
                "iam:GetAccountAuthorizationDetails",
                "iam:GetCredentialReport",
                "iam:ListPolicies",
                "iam:GetServerCertificate",
                "iam:GetRole",
                "iam:ListSAMLProviders",
                "iam:GetPolicy",
                "iam:GetAccessKeyLastUsed",
                "iam:ListEntitiesForPolicy",
                "cloudformation:*",
                "eks:RegisterCluster",
                "iam:GetUserPolicy",
                "iam:ListGroupsForUser",
                "ec2:*",
                "iam:GetGroupPolicy",
                "eks:ListClusters",
                "iam:GetOpenIDConnectProvider",
                "eks:*",
                "iam:GetRolePolicy",
                "iam:GetAccountSummary",
                "iam:CreateInstanceProfile",
                "iam:GenerateCredentialReport",
                "iam:GetServiceLastAccessedDetailsWithEntities",
                "iam:ListPoliciesGrantingServiceAccess",
                "iam:ListInstanceProfileTags",
                "iam:ListMFADevices",
                "iam:GetServiceLastAccessedDetails",
                "iam:GetGroup",
                "iam:GetContextKeysForPrincipalPolicy",
                "iam:GetOrganizationsAccessReport",
                "iam:GetServiceLinkedRoleDeletionStatus",
                "iam:ListInstanceProfilesForRole",
                "iam:PassRole",
                "iam:GenerateOrganizationsAccessReport",
                "iam:ListAttachedUserPolicies",
                "iam:ListAttachedGroupPolicies",
                "iam:ListPolicyTags",
                "eks:DescribeAddonVersions",
                "iam:GetSAMLProvider",
                "iam:ListAccessKeys",
                "eks:CreateCluster",
                "iam:GetInstanceProfile",
                "s3:*",
                "iam:ListGroupPolicies",
                "iam:GetSSHPublicKey",
                "sts:*",
                "iam:ListRoles",
                "iam:ListUserPolicies",
                "iam:ListInstanceProfiles",
                "iam:GetContextKeysForCustomPolicy",
                "iam:ListPolicyVersions",
                "iam:ListOpenIDConnectProviders",
                "iam:ListServerCertificateTags",
                "ecr:*",
                "iam:ListAccountAliases",
                "iam:ListUsers",
                "iam:GetUser",
                "iam:ListGroups",
                "iam:ListMFADeviceTags",
                "iam:GetLoginProfile",
                "iam:ListUserTags"
            ],
            "Resource": "*"
        }
    ]
  })
  tags = merge(var.default_tags, {
    Name = "${var.iam_user-policy}"
    },
  )
}



##================================================##
############## User Policy Attachment ##############
##================================================##

resource "aws_iam_policy_attachment" "user-policy-attach" {
  name       = var.iam_user-policy-attachment
//IAM User
  users      = [aws_iam_user.iam_username.name]
//ARN Policy  of "User_Policy"
  policy_arn = aws_iam_policy.user-policy.arn
//Role ID for Cloudformation
  roles = [aws_iam_role.Cloudformation.id]
}

##==================================================##
############## IAM Role for EKS Cluster ##############
##==================================================##

resource "aws_iam_role" "EKS_Cluster" {
//Name of EKS Cluster Role
  name = var.iam_role_eks

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
  tags = merge(var.default_tags, {
    Name = "${var.iam_role_eks}"
    },
  )
}

##=========================================================================================##
############## IAM Role of EKS Cluster Attachment to Amazon Managed EKS Policy ##############
##=========================================================================================##

resource "aws_iam_role_policy_attachment" "EKSRole-attach" {
//IAM Role Name of EKS Cluster
  role       = aws_iam_role.EKS_Cluster.name
//EKS Cluster policy from AWS managed Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


##=====================================================##
############## IAM Role for EKS WorkerNode ##############
##=====================================================##

resource "aws_iam_role" "eks-wrkr-node" {
//IAM Role Name of Worker Node
  name = var.iam_role_wrkr

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
  tags = merge(var.default_tags, {
    Name = "${var.iam_role_wrkr}"
    },
  )
}

##=============================================================================================##
############## IAM Role of WorkerNode Attached to Amazon Managed WorkerNode Policy ##############
##=============================================================================================##

resource "aws_iam_role_policy_attachment" "wrkr-role-1-attach" {
//IAM Role Name of WorkerNode
  role       = aws_iam_role.eks-wrkr-node.name
//ARN of AWS Managed Amazon EKS Worker Node Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

##===============================================================================================================##
############## IAM Role of WorkerNode Attached to Amazon Managed EC2ContainerRegistryReadOnly Policy ##############
##===============================================================================================================##

resource "aws_iam_role_policy_attachment" "wrkr-role-2-attach" {
//Role Name of WorkerNode
  role       = aws_iam_role.eks-wrkr-node.name
//ARN of AWS Managed EC2 Container Registry ReadOnly Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

##================================================================================================##
############## IAM Role of WorkerNode Attached to Amazon Managed AmazonEKS CNI Policy ##############
##================================================================================================##

resource "aws_iam_role_policy_attachment" "wrkr-role-3-attach" {
//Role Name of WorkerNode
  role       = aws_iam_role.eks-wrkr-node.name
//ARN of AWS Managed EKS CNI Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

##=========================================================================##
############## IAM Role || Service Link Role for EKS Nodegroup ##############
##=========================================================================##
##This source code can be created only once per account. Lifecycle code has been maintained here. While decommissioning please be aware of this source code.

/*
resource "aws_iam_service_linked_role" "AmazonEKSNodegroup" {
//Service Linked Role name
  aws_service_name = "eks-nodegroup.amazonaws.com"
  tags = merge(var.default_tags, {
    Name = "EKS Nodegroup Role"
    Description = "Service Link Role"
    },
  )
//Life Cycle Management
  lifecycle {
    prevent_destroy = true
  }
}
*/

##https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role
##https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html
##https://docs.aws.amazon.com/eks/latest/userguide/using-service-linked-roles-eks-nodegroups.html

##=====================================================##
############## IAM Role for CloudFormation ##############
##=====================================================##

resource "aws_iam_role" "Cloudformation" {
//IAM Role of cloudformation
  name = var.iam_role_Cloudformation

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudformation.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
  tags = merge(var.default_tags, {
    Name = "${var.iam_role_Cloudformation}"
    },
  )
}

##===================================================================================##
############## IAM Role of Cloudformation Attached to Custom User Policy ##############
##===================================================================================##

resource "aws_iam_role_policy_attachment" "Cloudformation-attach" {
//Name of Cloudformation Role
  role       = aws_iam_role.Cloudformation.name
//ARN of IAM User Policy 
  policy_arn =  aws_iam_policy.user-policy.arn
}

##===================================================##
############## IAM Role for Bastion Host ##############
##===================================================##

resource "aws_iam_role" "Bastion_Role" {
//IAM Role Name for the Bastion Host
  name = var.iam_role_Bastion_host

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })
  tags = merge(var.default_tags, {
    Name = "${var.iam_role_Bastion_host}"
    },
  )
}

##=================================================================================##
############## IAM Bastion Host Role Attached to Amazon Managed Policy ##############
##=================================================================================##

resource "aws_iam_role_policy_attachment" "Bastion_host_attach" {
//IAM Role Name of Bastion Host
  role       = aws_iam_role.Bastion_Role.name
//ARN of AWS EC2 Managed Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


/*
##==========================================##
############## IAM Role for EC2 ##############
##==========================================##

resource "aws_iam_role" "user_ec2_role" {
//IAM Role for EC2
  name = var.ec2_user_role

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })


  tags = merge(var.default_tags, {
    Name = "${var.ec2_user_role}"
    },
  )
}


##==============================================================================##
############## IAM Bastion Host Role Attached to Amazon User Policy ##############
##==============================================================================##


resource "aws_iam_role_policy_attachment" "EC2_Rl_plc_attach" {
//Name of EC2 IAM Role
  role       = aws_iam_role.user_ec2_role.name
//ARN of User Policy
  policy_arn = aws_iam_policy.user-policy.arn

}

*/