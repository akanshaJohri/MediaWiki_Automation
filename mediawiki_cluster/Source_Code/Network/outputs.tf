/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Network Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
06th Sep 2022    |  1.1     |  NECI  | Updated Below section                       |
                 |          |        | - Public Subnet ID                          |
                 |          |        | - Private Subnet ID                         |
                 |          |        | - Control Plane Security Group ID           |
                 |          |        | - Worker Node Security Group ID             |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
*/

/*
This file contains the source for displaying the value of provisioning resources at terminal after execution 
as well as saving it for utilization in other modules like EKS Cluster.
*/

//output of Bastion Host Security Group ID
output "BastionHostSG" {
    value = "${aws_security_group.BastionHostSecurityGroup.id}"
}
//output of VPC CIDR Block
output "vpc_cidr_block" {
    value = "${aws_vpc.vpc.cidr_block}"
}
//output of Public Subnet ID
output "pub_sub" {
    value = "${aws_subnet.public-01.id}"
}

//output of Private Subnet ID
output "prvt_sub_01" {
    value = "${aws_subnet.private-01.id}"
}

output "prvt_sub_02" {
    value = "${aws_subnet.private-02.id}"
}

//output of Control Plane Security Group ID
output "ControlPlane_SG" {
    value = "${aws_security_group.ControlPlaneSecurityGroup.id}"
}

//output of Worker Node Security Group ID
output "WorkerNode_SG" {
    value = "${aws_security_group.WorkerNodeSecurityGroup.id}"
}
