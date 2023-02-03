# Source code layout and step by step procedure to do provisioning configuration & decommisioning of AWS resources(IAM, Network,Bastion,EKS etc.) along with Application deployment.

## Overview
Ansible & Terraform has been used to do automation in this project.Below is the layout.

├── README.md
├── Source_Code
│   ├── IAM
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── Provider.tf
│   │   ├── terraform.tfvars
│   │   └── variable.tf
│   ├── Network
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── Provider.tf
│   │   ├── terraform.tfvars
│   │   └── variable.tf
│   ├── Bastion_Node
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── Provider.tf
│   │   ├── terraform.tfvars
│   │   └── variable.tf
│   ├── EKS-Cluster
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── Provider.tf
│   │   ├── terraform.tfvars
│   │   └── variable.tf
│   ├── EKS-WorkerNode
│   │   ├── customization.sh
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── Provider.tf
│   │   ├── terraform.tfvars
│   │   └── variable.tf
├── Ansible-Playbook
│   │   ├── bastion-node-config.yaml
│   │   ├── eks-cluster-config.yaml
│   │   ├── Inv
│   │   │   └── hosts
│   │   └── roles
│   │       ├── Bastion-Node-Role
│   │       │   ├── defaults
│   │       │   │   └── main.yml
│   │       │   ├── tasks
│   │       │   │   └── main.yml
│   │       │   └── vars
│   │       │       └── main.yml
│   │       └── EKS-Cluster-Role
│   │           ├── defaults
│   │           │   └── main.yml
│   │           ├── files
│   │           │   └── psp.yaml
│   │           ├── tasks
│   │           │   └── main.yml
│   │           ├── templates
│   │           │   └── cucp-values.yaml.j2
│   │           └── vars
│   │               └── main.yml
└── Tfstate_file
    ├── Bastion_Node
    │   ├── terraform.tfstate
    ├── EKS-Cluster
    │   ├── terraform.tfstate  
    ├── EKS-WorkerNode
    │   ├── terraform.tfstate  
    ├── IAM
    │   ├── terraform.tfstate
    └── Network
        ├── terraform.tfstate

Belows are the file maintained in this project.

**Below files are maintained for Ansible.**
	
- ** Bastion-Node-Config.yaml**: Used to call role for bastion node configuratione.

- ** EKS-Cluster-Config.yaml**: Used to call role for EKS cluster configuratione.
	
- ** hosts**: Mention all nodes where configuration need to be done.
	
- ** defaults/main.yml**: Contains temporary variable which will be used in task.

- ** tasks/main.yml**: Contains all set of tasks.

- ** vars/main.yml**: Contains variable which will be used in task.

- ** files/main.yml**: Contains static file (psp.yaml) which will be used in task.

- ** templates/main.yml**: Contains dynamic file (cucp-values.yaml.j2) which will be used in task.

**Below files are maintained for Terraform.**

- ** main.tf**: Based on the source code mention in this file, terraform will provision or decommission the resources.

- ** Provider.tf**: It contains the terraform provider details along with its version.

- ** variable.tf**: It contains the variable type which used in main.tf file.

- ** terraform.tfvars**: In this file end user can update the value of variable as per the use cases.

- **outputs.tf**: This file contains the source for displaying the value of some provisioning resources at terminal after execution as well as saving it for utilization in other modules.

- **terraform.tfstate**: It contains all relevant information once resource provisioned.

- **customization.sh**: It contains the user data to customize the worker node.

### Prerequisite to run source code

#### 1. Setup the AWS User [Credential](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)
#### 2. Configure the AWS Credential on terraform VM Terminal
        #aws configure
        AWS Access Key ID [****************JK7L]: XXXXXXXXXXXXXXXX
        AWS Secret Access Key [****************7CeA]:XXXXXXXXXXXXXXXXXXXXXXXXX
        Default region name [us-east-1]: XXXXXXXX
        Default output format [table]: XXXXXXXX

- **`Source_Code/IAM` will be executed using `AWS Admin User Credential`.**
- **`Source_Code/Network`, `Source_Code/Bastion_Node`, `Source_Code/EKS-Cluster`, `Source_Code/EKS-WorkerNode` can be executed using `IAM User Credential`.**
- **In `Source_Code/EKS-WorkerNode/customization.sh` file, value of `B64_CLUSTER_CA`, `API_SERVER_URL`, `K8S_CLUSTER_DNS_IP` will be updated based on output on EKS Cluster Creation**
- **
#### 3. Edit the Host file with bastion node IP
- **`Source_Code/Ansible-Playbook/Inv/hosts` will be updated with bastion node IP address, path to private key file along with user.
	<Ip Address of bastion node> ansible_user=<user-name> ansible_ssh_private_key_file=<path to private key file>
#### 4. Edit the vars/main.yml with worker node IP &  other relevant parameters
- **`Source_Code/Ansible-Playbook/roles/EKS-Cluster-Role or Bastion-Node-Role/vars/main.yml` will be updated with worker node IP.
#### 5. Edit defaults/main.yaml  if required
- **`Source_Code/Ansible-Playbook/roles/EKS-Cluster-Role or Bastion-Node-Role/defaults/main.yml` will be updated if required.

### Execution of Automation

#### 1. Move to directory NEC-Automation/Source_Code/ 
#### 2. While provisioning & configuring the AWS Resource along with application deployment, trigger the terraform & Ansible playbook in below mention flow.**
        `Source_Code/IAM`
        `Source_Code/Network`
        `Source_Code/Bastion_Node`
        `Source_Code/Ansible-Playbook/`    ##Playbook will be triggered with `bastion-node-config.yaml` for customization of bastion node.
        `Source_Code/EKS-Cluster`
        `Source_Code/EKS-WorkerNode`
        `Source_Code/Ansible-Playbook`     ##Playbook will be triggered with `eks-cluster-config.yaml` for customozation of EKS cluster & Application deployment.

#### 7. While decommissioning the AWS Resource, trigger the Terraform Code in below mention flow.**
        `Source_Code/EKS-WorkerNode`
        `Source_Code/EKS-Cluster`
        `Source_Code/Bastion_Node`
        `Source_Code/Network`
        `Source_Code/IAM`

Note: Decommisioning is limited to AWS resources only.

#### 8. Provision & Destroy of AWS Resource using Terraform**
---
#### a. Initialize the terraform
        - terraform init
#### b. Verify the resource which going to provision
        - terraform plan
#### c. Provision the AWS IAM Resource
        - terraform apply
#### d. Destroy the resource
        - terraform destroy
Provide "yes" if wants to provision AWS resource, else provide "no" to cancel it

#### 9. Installation, Configuration & Application deployment on Bastion node & EKS cluster using Ansible **
---
#### a. Command to customize bation host
        - ansible-playbook -i Source_Code/Ansible-Playbook/Inv/hosts bation-node-config.yaml
#### b. Command to customize EKS cluster and Application deployment
        - ansible-playbook -i Source_Code/Ansible-Playbook/Inv/hosts eks-cluster-config.yaml
    
**Copyright**
NEC Corporation (hereinafter referred to as “Company” owns the copyright of this document.
It is prohibited to copy, modify and translate part of or all contents of this document without consent from Company.
Copyrightⓒ NEC Corporation 2022

**Trademarks**
Company names and product names described in this document are trademarks and registered trademarks of each company.
    	
