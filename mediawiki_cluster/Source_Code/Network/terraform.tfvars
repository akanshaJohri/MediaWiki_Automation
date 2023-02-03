/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Network Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

##This file is a variable file which contains the End User Input. User can update the data according to the use cases 

//Global Tags which applied for all Network Resource
default_tags = {
    Service = "Automation"
    ManagedBy = "Terraform"
    Team = "Public Cloud Team"
}

//CIDR Block of VPC
vpc_cidr_block = "20.0.0.0/16"

//Name of VPC
vpc_cidr_block_tags = "Auto-NECI-ORAN-VPC"

//CIDR Block of Private Subnet 01
private-01-cidr_block = "20.0.1.0/24"
//Availibity Zone of Private Subnet 01
private-01-AZ = "us-east-1a"
//Name of Private Subnet 01
private-01-cidr_block_tags = "Auto-NECI-ORAN-Private-Subnet-01"

//CIDR Block of Private Subnet 02
private-02-cidr_block = "20.0.2.0/24"
//Availibity Zone of Private Subnet 02
private-02-AZ = "us-east-1b"
//Name of Private Subnet 02
private-02-cidr_block_tags = "Auto-NECI-ORAN-Private-Subnet-02"


//CIDR Block of Public Subnet 01
public-01-cidr_block = "20.0.11.0/24"
//Availibity Zone of Public Subnet 01
public-01-AZ = "us-east-1c"
//Name of Public Subnet 01
public-01-cidr_block_tags = "Auto-NECI-ORAN-public-Subnet-01"

//Name of Internet Gateway
internet_gateway_tags = "Auto-NEC-ORAN-IGW"

//Name of Public Routetable
rt_pub_tags = "Auto-NECI-ORAN-RouteTable-01-Public"

//Name & Tag of Private Routetable
rt_priv_tags = "Auto-NECI-ORAN-RouteTable-01-Private"

//Name of ControlPlane Security Group
cntrl_pln_sg_tags = "Auto-NECI-ORAN-VPC-ControlPlaneSecurityGroup"
//Name of WorkerNode Security Group
wrkr_nd_sg_tags = "Auto-NECI-ORAN-VPC-WorkerNodeSecurityGroup"
//Name of Bastion host Security Group
bastion_nd_sg_tags = "Auto_ORAN_NECI_SG_Bastion_host"
//Name of Endpoint-Interface Security Group
endpoint_sg_tags = "Auto-SGR-NECI-ORAN-Endpoint-Interface"

//Name of EC2 Endpoint Interface
ec2_ep_intrfc_tags = "Auto-NECI-ORAN-EC2-Endpoint-Interface"
//Name of STS Endpoint Interface
sts_ep_intrfc_tags = "Auto-NECI-ORAN-STS-Endpoint-Interface"
//Name of ECR-DKR Endpoint Interface
ecr_dkr_ep_intrfc_tags = "Auto-NECI-ORAN-ECR-DKR-Endpoint-Interface"
//Name of ECR-API Endpoint Interface
ecr_api_ep_intrfc_tags = "Auto-NECI-ORAN-ECR-API-Endpoint-Interface"
//Name of S3 Endpoint Gateway
s3_ep_gw_tags = "Auto-NECI-ORAN-S3-Endpoint-Gateway"

