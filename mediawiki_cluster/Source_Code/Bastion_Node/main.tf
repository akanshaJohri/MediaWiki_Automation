/*

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Issue Date       | Revision | Author | Content                                      |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _| _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Bastion Resource      |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _| _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

## This File contains the source Code for provisioning/decommissioning of AWS Bastion Node resource i.e. key-pain, ec2 etc

##=========================================================##
##############Keypair of Bastion Host Instance###############
##=========================================================##

##Use the below step to create a private and public from local Machine
##Use the Public key during EC2 Creation
##Use private key to take login access to EC2 Instance

#                    root@BLLT-5CD112LVNG:~# ssh-keygen
#                    Generating public/private rsa key pair.
#                    Enter file in which to save the key (/root/.ssh/id_rsa): /aws_terraform/id_rsa
#                    Enter passphrase (empty for no passphrase):
#                    Enter same passphrase again:
#                    Your identification has been saved in /aws_terraform/id_rsa
#                    Your public key has been saved in /aws_terraform/id_rsa.pub
#                    The key fingerprint is:
#                    SHA256:QWEynBcvhvcad+szLn+NlKgvjfbVevbZAbKu73ztCBM root@BLLT-5CD112LVNG
#                    The key's randomart image is:
#                    +---[RSA 3072]----+
#                    |     .o.=o       |
#                    |      o*..       |
#                    |      ..= .      |
#                    |       o +       |
#                    |        S oE.o . |
#                    |         + .=.+. |
#                    |        .  B..o+.|
#                    |          O.*o+oB|
#                    |         o+%B=o=+|
#                    +----[SHA256]-----+
#                    root@BLLT-5CD112LVNG:~#
#

resource "aws_key_pair" "deployer" {
  key_name   = var.name_kp

//Public Key created by User
  public_key = var.public_key_kp    
}

##====================================================##
##############Creation of Bastion Instance##############
##====================================================##

resource "aws_instance" "BastionNode" {

//AMI ID of EC2 to Deploy Bastion Node
  ami           = var.ami_bastion

//Bastion Node Instance Type
  instance_type = var.inst_type_bastion

//key pair name 
  key_name = aws_key_pair.deployer.key_name

//ID of Bastion Host Security Group
  vpc_security_group_ids = ["${data.terraform_remote_state.nest_tfst.outputs.BastionHostSG}"]

//ID of Public Subnet 
  subnet_id = "${data.terraform_remote_state.nest_tfst.outputs.pub_sub}"
  associate_public_ip_address = true

  depends_on = [
    data.terraform_remote_state.nest_tfst
  ]

  tags = merge(var.default_tags, {
    Name = "${var.bastion_tag}"
    },
  )
  root_block_device {
//Size of Root block Storage Device in GB
    volume_size = var.sz_root_blk_storage
//Type of Block Storage
    volume_type = var.type_root_blk_storage
  }

}
