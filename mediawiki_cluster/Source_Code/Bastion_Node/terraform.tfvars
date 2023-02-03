/*
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Issue Date       | Revision | Author | Content                                     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|
21st Sep 2022    |  1.0     |  NECI  | Initial Source Code of Bastion Resource     |
_ _ _ _ _ _ _ _ _| _ _ _ _ _| _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _|

*/

##This file is a variable file which contains the End User Input. User can update the data according to the use cases.

//Global Tags which applied for all Bastion Resource
default_tags = {
    Service = "Automation"
    ManagedBy = "Terraform"
    Team = "Public Cloud Team"
}

//Name of Key Pair for Bastion Node
name_kp = "Auto_deployer-key"

//Public Key of Keypair for Bastion Node
public_key_kp = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCszCp9kNJGGy6+Cmw3zi+0nhZiNydPXyR6sjLNE7w/6Fz5/Ckk7RI+2QvDHqM36FEiKuu/bsg3SRmJsAE8jwpJYTC3XZdABvIo//Un2BBDbh/WrakE4noQ4mX5jAHkhtDdXjBsG2fArdexRYBc1VppEMmP2S3keVzZCJWGNJn6hYgg8yDYCqB4RLle8h6GuWqH5ZVW+dqtoxCwWSymdowcxhXP4/4OPJb0X4Jnj8XuTXZFAWMT74khrTWbeMIwbs/jyJjoNNYJRk4f7zowNIOxoZco95edOzAOvETe+AgSQ7E8RQ1/nuAW2uFVViLVg1MIY2VTR+UAwfXjLTMQ8fDH7XcNCtx6KHzr6um95nkykYNnvHKutn+Mn7FKp1AMT1S80rJo4ImCYmRwl0dGeUIXLjSWRA7qhQMhk9Q0/+9pH8Owg6ma574aCDUSFkXu9lEFr8jTo6QsAHHc7S/AgfJBAq2tEojQ6bNj2NWJId+n/516CdGe4YNyorlKdNz4YC0= root@BLLT-5CD112LVNG"

//AMI ID of EC2 Machine to deploy Bastion Node
ami_bastion = "ami-090fa75af13c156b4"

//Instance Type of Bastion Node
inst_type_bastion = "t2.micro"

//Name  of Bastion Node
bastion_tag = "Auto_HelloWorld"

//Size of Root Block Storage in GB
sz_root_blk_storage = "20"
//Type of Root Block Storage
type_root_blk_storage = "gp2"