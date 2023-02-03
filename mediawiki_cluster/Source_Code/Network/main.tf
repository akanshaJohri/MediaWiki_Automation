ecc /*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Network Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This File contains the source Code for provisioning/decommissioning of AWS Network resource i.e. VPC, Subnet, Routes, Internet Gateway, Endpoint etc

##=======================================##
##############Creation of VPC##############
##=======================================##

resource "aws_vpc" "vpc" {

//CIDR Block of VPC
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

//By Default its True
  enable_dns_support = "true"

//By Default its False, Set it to True
  enable_dns_hostnames = "true"

  tags = merge(var.default_tags, {
    Name = "${var.vpc_cidr_block_tags}"
    },
  )
}

##==================================================##
##############Creation of Private Subnet##############
##==================================================##

resource "aws_subnet" "private-01" {

//ID of VPC associate with Subnet
  vpc_id     = aws_vpc.vpc.id

//CIDR Block of 1st Private Subnet
  cidr_block = var.private-01-cidr_block

//Availbility Zone of 1st Private Subnet
  availability_zone = var.private-01-AZ

  tags = merge(var.default_tags, {
    Name = "${var.private-01-cidr_block_tags}"
    },
  )
}


resource "aws_subnet" "private-02" {

//ID of VPC associate with Subnet
  vpc_id     = aws_vpc.vpc.id

//CIDR Block of 2nd Private Subnet
  cidr_block = var.private-02-cidr_block

//Availbility Zone of 2nd Private Subnet
  availability_zone = var.private-02-AZ

  tags = merge(var.default_tags, {
    Name = "${var.private-02-cidr_block_tags}"
    },
  )
}

##=================================================##
##############Creation of Public Subnet##############
##=================================================##

resource "aws_subnet" "public-01" {

//ID of VPC associate with Subnet
  vpc_id     = aws_vpc.vpc.id

//CIDR Block of Public Subnet
  cidr_block = var.public-01-cidr_block

//Availbility Zone of Public Subnet
  availability_zone = var.public-01-AZ
  map_public_ip_on_launch = "true"

  tags = merge(var.default_tags, {
    Name = "${var.public-01-cidr_block_tags}"
    },
  )
}

##====================================================##
##############Creation of Internet Gateway##############
##====================================================##

resource "aws_internet_gateway" "gw" {

//ID of VPC associate with Internet Gateway
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.default_tags, {
    Name = "${var.internet_gateway_tags}"
    },
  )
}

##=======================================================##
##############Creation of Public Route Table ##############
##=======================================================##

resource "aws_route_table" "RouteTable-Public" {

//ID of VPC associate with Route Table
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.default_tags, {
    Name = "${var.rt_pub_tags}"
    },
  )
}

##=======================================================================##
##############Public Subnet Associate with Public Route Table##############
##=======================================================================##

resource "aws_route_table_association" "Subnet-Associate-Public" {

//ID of Public Subnet
  subnet_id      = aws_subnet.public-01.id

//ID of Public Route Table 
  route_table_id = aws_route_table.RouteTable-Public.id
}

##==========================================================================##
##############Attachment of Internet Gateway to the Public Route##############
##==========================================================================##

resource "aws_route" "route-public" {

//ID of Public Route Table  
  route_table_id = aws_route_table.RouteTable-Public.id

//CIDR Block to Allow all IP
  destination_cidr_block = "0.0.0.0/0"

//Internet Gateway ID
  gateway_id      = aws_internet_gateway.gw.id
}

##====================================================##
##############Creation Private Route Table##############
##====================================================##

resource "aws_route_table" "RouteTable-Private" {

##ID of VPC associated with Private Route Table
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.default_tags, {
    Name = "${var.rt_priv_tags}"
    },
  )
}


##=========================================================================##
##############Private Subnet Associate with Private Route Table##############
##=========================================================================##

resource "aws_route_table_association" "Subnet-Associate-Private-01" {

//ID of 1st Private Subnet
  subnet_id      = aws_subnet.private-01.id

//ID of Private Route 
  route_table_id = aws_route_table.RouteTable-Private.id
}


resource "aws_route_table_association" "Subnet-Associate-Private-02" {

//ID of 1st Private Subnet
  subnet_id      = aws_subnet.private-02.id

//ID of Private Route 
  route_table_id = aws_route_table.RouteTable-Private.id
}



##=================================================================##
##############Creation of Control Plane Security Group ##############
##=================================================================##

resource "aws_security_group" "ControlPlaneSecurityGroup" {

//Name of Control Plane Security Group
  name        = var.cntrl_pln_sg_tags
  description = "Required During EKS Cluster Creation"

//ID of VPC
  vpc_id      = aws_vpc.vpc.id

//Ingress/Inbound Rule for allowing HTTPS inside of VPC CIDR
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

//Egress/Outbound Rule to allow ALL
  egress {                              
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {
    Name = "${var.cntrl_pln_sg_tags}"
    Description = "Required During EKS Cluster Creation"
    },
  )
}

##===============================================================##
##############Creation of Worker Node Security Group ##############
##===============================================================##

resource "aws_security_group" "WorkerNodeSecurityGroup" {

////Name of Worker Node Security Group
  name        = var.wrkr_nd_sg_tags
  description = "Required During Worker Node Security Group"

//ID of VPC
  vpc_id      = aws_vpc.vpc.id

//Ingress/Inbound Rule
  ingress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

//Egress/Outbound Rule
  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

  tags = merge(var.default_tags, {
    Name = "${var.wrkr_nd_sg_tags}"
    },
  )
}

##================================================================##
##############Creation of Bastion Host Security Group ##############
##================================================================##

resource "aws_security_group" "BastionHostSecurityGroup" {

//Name of Bastion Host Security Group
  name        = var.bastion_nd_sg_tags
  description = "Required During Bastion Host Creation"

//ID of VPC
  vpc_id      = aws_vpc.vpc.id

//Ingress/Inbound Rule for ICMP
  ingress {
    description      = "Ping Connectivity"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

//Ingress/Inbound Rule for SSH
  ingress {
    description      = "SSH Connectivity"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

//Egress/Outbound Rule
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {
    Name = "${var.bastion_nd_sg_tags}"
    },
  )
}


##============================================================##
##############Creation of Endpoint Security Group ##############
##============================================================##

resource "aws_security_group" "EndPointSecurityGroup" {

//Name of Endpoint Security Group
  name        = var.endpoint_sg_tags
  description = "Required During Endpoint Creation"

//ID of VPC
  vpc_id      = aws_vpc.vpc.id

//Ingress/Inbound Rule
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

//Egress/Outbound Rule
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {
    Name = "${var.endpoint_sg_tags}"
    },
  )
}


##====================================================================##
##############Creation of Endpoint: EC2-Endpoint-Interface##############
##====================================================================##

resource "aws_vpc_endpoint" "EC2-EndPoint" {

//ID of VPC
  vpc_id            = aws_vpc.vpc.id

//EC2 Service Name
  service_name      = "com.amazonaws.us-east-1.ec2"
//Endpoint Type
  vpc_endpoint_type = "Interface"

//Endpoint Security Group ID
  security_group_ids = [
    aws_security_group.EndPointSecurityGroup.id,
  ]

//Private Subnet ID
  subnet_ids = [
    aws_subnet.private-01.id, aws_subnet.private-02.id,
    ]
  
  tags = merge(var.default_tags, {
    Name = "${var.ec2_ep_intrfc_tags}"
    },
  )

##Private DNS Enablement
  private_dns_enabled = true
  
}

##====================================================================##
##############Creation of Endpoint: STS-Endpoint-Interface##############
##====================================================================##

resource "aws_vpc_endpoint" "STS-EndPoint" {

//ID of VPC
  vpc_id            = aws_vpc.vpc.id

//STS Service Name
  service_name      = "com.amazonaws.us-east-1.sts"
//Endpoint Type
  vpc_endpoint_type = "Interface"

//Endpoint Security Group ID
  security_group_ids = [
    aws_security_group.EndPointSecurityGroup.id,
  ]

//Private Subnet ID
  subnet_ids = [
    aws_subnet.private-01.id, aws_subnet.private-02.id,
    ]
//Private DNS Enablement
  private_dns_enabled = true
  
  tags = merge(var.default_tags, {
    Name = "${var.sts_ep_intrfc_tags}"
    },
  )

}

##========================================================================##
##############Creation of Endpoint: ECR-DKR-Endpoint-Interface##############
##========================================================================##

resource "aws_vpc_endpoint" "ECR-DKR-EndPoint" {
//ID of VPC
  vpc_id            = aws_vpc.vpc.id

//ECR-DKR Service Name
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
//Endpoint Type
  vpc_endpoint_type = "Interface"

//Endpoint Security Group ID
  security_group_ids = [
    aws_security_group.EndPointSecurityGroup.id,
  ]

//Private Subnet ID
  subnet_ids = [
    aws_subnet.private-01.id, aws_subnet.private-02.id,
    ]

//Private DNS Enablement
  private_dns_enabled = true
    
  tags = merge(var.default_tags, {
    Name = "${var.ecr_dkr_ep_intrfc_tags}"
    },
  )

  
}

##========================================================================##
##############Creation of Endpoint: ECR-API-Endpoint-Interface##############
##========================================================================##

resource "aws_vpc_endpoint" "ECR-API-EndPoint" {
//ID of VPC
  vpc_id            = aws_vpc.vpc.id

//ECR-API Service Name
  service_name      = "com.amazonaws.us-east-1.ecr.api"

//Endpoint Type
  vpc_endpoint_type = "Interface"

//Endpoint Security Group ID
  security_group_ids = [
    aws_security_group.EndPointSecurityGroup.id,
  ]

//Private Subnet ID
  subnet_ids = [
    aws_subnet.private-01.id, aws_subnet.private-02.id,
    ]

//Private DNS Enablement
  private_dns_enabled = true

  tags = merge(var.default_tags, {
    Name = "${var.ecr_api_ep_intrfc_tags}"
    },
  )

  
}

##=================================================================##
##############Creation of Endpoint: S3-Endpoint-Gateway##############
##=================================================================##

resource "aws_vpc_endpoint" "S3-EndPoint-Gateway" {
//ID of VPC
  vpc_id            = aws_vpc.vpc.id

//S3 Service Name
  service_name      = "com.amazonaws.us-east-1.s3"
//Endpoint Type
  vpc_endpoint_type = "Gateway"
  
//Private Route Table ID
  route_table_ids = [
    aws_route_table.RouteTable-Private.id,
  ]

//Private DNS Enablement
  private_dns_enabled = false

  tags = merge(var.default_tags, {
    Name = "${var.s3_ep_gw_tags}"
    },
  )
}


