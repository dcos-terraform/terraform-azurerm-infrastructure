variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

# Bootstrap node disk size (gb)
variable "bootstrap_disk_size" {
  description = "bootstrap disk size"
  default     = ""
}

# Bootstrap node disk type.
variable "bootstrap_disk_type" {
  description = "bootstrap disk type"
  default     = "Standard_LRS"
}

# Bootstrap node machine type
variable "bootstrap_instance_type" {
  description = "[BOOTSTRAP] Instance type"
  default     = "Standard_B2s"
}

# Bootstrap node OS image
variable "bootstrap_image" {
  description = "bootstrap image"
  default     = ""
}

# Master node disk size (gb)
variable "master_disk_size" {
  description = "master disk size"
  default     = ""
}

# Master node disk type.
variable "master_disk_type" {
  description = "master disk type"
  default     = "Standard_LRS"
}

# Master node machine type
variable "master_instance_type" {
  description = "master instance type"
  default     = "Standard_D4s_v3"
}

# Master node OS image
variable "master_image" {
  description = "master image"
  default     = ""
}

# Private agent node disk size (gb)
variable "private_agent_disk_size" {
  description = "private agent disk size"
  default     = ""
}

# Private agent node disk type.
variable "private_agent_disk_type" {
  description = "private agent disk type"
  default     = "Standard_LRS"
}

# Private agent node machine type
variable "private_agent_instance_type" {
  description = "private agent instance type"
  default     = "Standard_D4s_v3"
}

# Private agent node OS image
variable "private_agent_image" {
  description = "private agent image"
  default     = ""
}

# Public agent disk size (gb)
variable "public_agent_disk_size" {
  description = "public agent disk size"
  default     = ""
}

# Public agent node disk type.
variable "public_agent_disk_type" {
  description = "public agent disk type"
  default     = "Standard_LRS"
}

# Public agent machine type
variable "public_agent_instance_type" {
  description = "public agent instance type"
  default     = "Standard_D4s_v3"
}

# Public agent node OS image
variable "public_agent_image" {
  description = "public agent image"
  default     = ""
}

# Master node Public SSH Key
variable "master_public_ssh_key_path" {
  description = "master public ssh key path"
  default     = ""
}

# Private Agent node Public SSH Key
variable "private_agent_public_ssh_key_path" {
  description = "private agent public ssh key path"
  default     = ""
}

# Public Agent node Public SSH Key
variable "public_agent_public_ssh_key_path" {
  description = "public agent public ssh key path"
  default     = ""
}

# Bootstrap Node Public SSH Key
variable "bootstrap_public_ssh_key_path" {
  description = "bootstrap public ssh key path"
  default     = ""
}

# Azure Region
variable "location" {
  description = "location"
  default     = ""
}

# Master node SSH User
variable "master_admin_username" {
  description = "master admin username"
  default     = ""
}

# Bootstrap node SSH User
variable "bootstrap_admin_username" {
  description = "bootstrap admin username"
  default     = ""
}

# Public Agent node SSH User
variable "public_agent_admin_username" {
  description = "public agent admin username"
  default     = ""
}

# Private Agent ndoe SSH User
variable "private_agent_admin_username" {
  description = "private agent admin username"
  default     = ""
}

# Global Infra SSH User
variable "infra_admin_username" {
  description = "infra admin username"
  default     = "dcos_admin"
}

variable "ssh_public_key" {
  description = "SSH public key in authorized keys format (e.g. 'ssh-rsa ..') to be used with the instances. Make sure you added this key to your ssh-agent."
  default     = ""
}

variable "ssh_public_key_file" {
  description = "Path to SSH public key. This is mandatory but can be set to an empty string if you want to use ssh_public_key with the key as string."
}

# Global Infra Disk Type
variable "infra_disk_type" {
  description = "infra disk type"
  default     = "Standard_LRS"
}

# Global Infra Disk Size
variable "infra_disk_size" {
  description = "infra disk size"
  default     = "128"
}

# Global Infra Machine Type
variable "infra_instance_type" {
  description = "infra instance type"
  default     = "Standard_DS11_v2"
}

# Global Infra Tested OSes Image
variable "infra_dcos_instance_os" {
  description = "infra dcos instance os"
  default     = "centos_7.3"
}

# Master node tested OSes image
variable "master_dcos_instance_os" {
  description = "master dcos instance os"
  default     = ""
}

# Public Agent node tested OSes image
variable "public_agent_dcos_instance_os" {
  description = "public agent dcos instance os"
  default     = ""
}

# Private agent node tested OSes image
variable "private_agent_dcos_instance_os" {
  description = "private agent dcos instance os"
  default     = ""
}

# Bootstrap node tested OSes image
variable "bootstrap_dcos_instance_os" {
  description = "bootstrap dcos instance os"
  default     = ""
}

##############################
#                            #
#  Terraform DCOS Variables  #
##############################

# Number of Masters
variable "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  default     = "3"
}

# Number of Private Agents
variable "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
  default     = "1"
}

# Number of Public Agents
variable "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
  default     = "1"
}

# DCOS Version
variable "dcos_version" {
  description = "Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list."
  default     = "1.11.4"
}

# Add special tags to the resources created by this module
variable "tags" {
  description = "Add custom tags to all resources"
  type        = "map"
  default     = {}
}

variable "subnet_range" {
  description = "Private IP space to be used in CIDR format"
  default     = "172.31.0.0/16"
}

variable "admin_ips" {
  description = "List of CIDR admin IPs"
  type        = "list"
}
