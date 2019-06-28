variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "bootstrap_disk_size" {
  description = "Bootstrap node disk size (gb)"
  default     = ""
}

variable "bootstrap_disk_type" {
  description = "Bootstrap node disk type."
  default     = "Standard_LRS"
}

variable "bootstrap_vm_size" {
  description = "[BOOTSTRAP] Azure virtual machine size"
  default     = "Standard_B4ms"
}

variable "bootstrap_image" {
  description = "[BOOTSTRAP] Image to be used"
  type        = "map"
  default     = {}
}

variable "masters_disk_size" {
  description = "Masters node disk size (gb)"
  default     = ""
}

variable "masters_disk_type" {
  description = "Masters node disk type."
  default     = "Standard_LRS"
}

variable "masters_vm_size" {
  description = "[MASTERS] Azure virtual machine size"
  default     = "Standard_D4s_v3"
}

variable "masters_image" {
  description = "[MASTERS] Image to be used"
  type        = "map"
  default     = {}
}

variable "private_agents_disk_size" {
  description = "Private agent node disk size (gb)"
  default     = ""
}

variable "private_agents_disk_type" {
  description = "Private agent node disk type."
  default     = "Standard_LRS"
}

variable "private_agents_vm_size" {
  description = "[PRIVATE AGENTS] Azure virtual machine size"
  default     = "Standard_D4s_v3"
}

variable "private_agents_image" {
  description = "[PRIVATE AGENTS] Image to be used"
  type        = "map"
  default     = {}
}

variable "public_agents_disk_size" {
  description = "Public agent disk size (gb)"
  default     = ""
}

variable "public_agents_disk_type" {
  description = "Public agent node disk type."
  default     = "Standard_LRS"
}

variable "public_agents_vm_size" {
  description = "[PUBLIC AGENTS] Azure virtual machine size"
  default     = "Standard_D4s_v3"
}

variable "public_agents_image" {
  description = "[PUBLIC AGENTS] Image to be used"
  type        = "map"
  default     = {}
}

variable "location" {
  description = "Azure Region"
  default     = ""
}

variable "master_ssh_user" {
  description = "Master node SSH User"
  default     = ""
}

variable "bootstrap_ssh_user" {
  description = "Bootstrap node SSH User"
  default     = ""
}

variable "public_agent_ssh_user" {
  description = "Public Agent node SSH User"
  default     = ""
}

variable "private_agent_ssh_user" {
  description = "Private Agent node SSH User"
  default     = ""
}

variable "infra_ssh_user" {
  description = "Global Infra SSH User"
  default     = ""
}

variable "ssh_public_key" {
  description = "SSH public key in authorized keys format (e.g. 'ssh-rsa ..') to be used with the instances. Make sure you added this key to your ssh-agent."
  default     = ""
}

variable "ssh_public_key_file" {
  description = "Path to SSH public key. This is mandatory but can be set to an empty string if you want to use ssh_public_key with the key as string."
}

variable "infra_disk_type" {
  description = "Global Infra Disk Type"
  default     = "Standard_LRS"
}

variable "infra_disk_size" {
  description = "Global Infra Disk Size"
  default     = "128"
}

variable "infra_vm_size" {
  description = "Global Infra Machine Type"
  default     = "Standard_DS11_v2"
}

variable "infra_dcos_instance_os" {
  description = "Global Infra Tested OSes Image"
  default     = "centos_7.6"
}

variable "masters_dcos_instance_os" {
  description = "Master node tested OSes image"
  default     = ""
}

variable "public_agents_dcos_instance_os" {
  description = "Public Agent node tested OSes image"
  default     = ""
}

variable "private_agents_dcos_instance_os" {
  description = "Private agent node tested OSes image"
  default     = ""
}

variable "bootstrap_dcos_instance_os" {
  description = "Bootstrap node tested OSes image"
  default     = ""
}

variable "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  default     = "3"
}

variable "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
  default     = "1"
}

variable "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
  default     = "1"
}

variable "tags" {
  description = "Add custom tags to all resources"
  type        = "map"
  default     = {}
}

variable "subnet_range" {
  description = "Private IP space to be used in CIDR format"
  default     = "172.12.0.0/16"
}

variable "admin_ips" {
  description = "List of CIDR admin IPs"
  type        = "list"
}

variable "public_agents_additional_ports" {
  description = "List of additional ports allowed for public access on public agents (80 and 443 open by default)"
  default     = []
}

variable "azurerm_storage_account_name" {
  description = "The Azure Storage Account Name for External Exhibitor"
  default     = ""
}

variable "name_prefix" {
  description = "Name Prefix"
  default     = ""
}

variable "accepted_internal_networks" {
  description = "Subnet ranges for all internal networks"
  type        = "list"
  default     = []
}

variable "avset_platform_fault_domain_count" {
  description = "Availability set platform fault domain count, differs from location to location"
  default     = 3
}
