/*

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                      |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _| _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Bastion Resource      |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _| _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/


/*
This file contains the source for displaying the value of provisioning resources at terminal after execution 
as well as saving it for utilization in other modules like EKS Cluster.
*/

//Output of Bastion Node Public IP
output "ec2_pub_ip" {
    value = aws_instance.BastionNode.public_ip
    description = "Bastion Node Public IP"
}