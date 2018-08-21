#
variable "name_prefix" {}

# GCP Builing Account
variable "gcp_billing_account" {
  default = ""
}

# GCP Org ID
variable "gcp_org_id" {
  default = ""
}

# Existing Project ID
variable "gcp_project_id" {
  default = ""
}

# GCP Credentials JSON
variable "gcp_credentials_path_json" {}

# Bootstrap node disk size (gb)
variable "gcp_bootstrap_disk_size" {
  default = ""
}

# Bootstrap node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "gcp_bootstrap_disk_type" {
  default = ""
}

# Bootstrap node machine type
variable "gcp_bootstrap_machine_type" {
  default = ""
}

# Bootstrap node OS image
variable "gcp_bootstrap_image" {
  default = ""
}

# Master node disk size (gb)
variable "gcp_master_disk_size" {
  default = ""
}

# Master node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "gcp_master_disk_type" {
  default = ""
}

# Master node machine type
variable "gcp_master_machine_type" {
  default = ""
}

# Master node OS image
variable "gcp_master_image" {
  default = ""
}

# Private agent node disk size (gb)
variable "gcp_private_agent_disk_size" {
  default = ""
}

# Private agent node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "gcp_private_agent_disk_type" {
  default = ""
}

# Private agent node machine type
variable "gcp_private_agent_machine_type" {
  default = ""
}

# Private agent node OS image
variable "gcp_private_agent_image" {
  default = ""
}

# Public agent disk size (gb)
variable "gcp_public_agent_disk_size" {
  default = ""
}

# Public agent node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard".
variable "gcp_public_agent_disk_type" {
  default = ""
}

# Public agent machine type
variable "gcp_public_agent_machine_type" {
  default = ""
}

# Public agent node OS image
variable "gcp_public_agent_image" {
  default = ""
}

# Master node Public SSH Key
variable "gcp_master_public_ssh_key_path" {
  default = ""
}

# Private Agent node Public SSH Key 
variable "gcp_private_agent_public_ssh_key_path" {
  default = ""
}

# Public Agent node Public SSH Key
variable "gcp_public_agent_public_ssh_key_path" {
  default = ""
}

# Bootstrap Node Public SSH Key
variable "gcp_bootstrap_public_ssh_key_path" {
  default = ""
}

# GCP Region
variable "gcp_region" {
  default = ""
}

# Master node SSH User
variable "gcp_master_ssh_user" {
  default = ""
}

# Bootstrap node SSH User
variable "gcp_bootstrap_ssh_user" {
  default = ""
}

# Public Agent node SSH User
variable "gcp_public_agent_ssh_user" {
  default = ""
}

# Private Agent ndoe SSH User
variable "gcp_private_agent_ssh_user" {
  default = ""
}

# Global Infra SSH User
variable "infra_ssh_user" {
  default = ""
}

# Global Infra Public SSH Key
variable "infra_public_ssh_key_path" {
  default = ""
}

# Global Infra Disk Type
variable "infra_disk_type" {
  default = ""
}

# Global Infra Disk Size
variable "infra_disk_size" {
  default = ""
}

# Global Infra Machine Type
variable "infra_machine_type" {
  default = ""
}

# Global Infra Tested OSes Image
variable "infra_dcos_instance_os" {
  default = ""
}

# Master node tested OSes image
variable "gcp_master_dcos_instance_os" {
  default = ""
}

# Public Agent node tested OSes image
variable "gcp_public_agent_dcos_instance_os" {
  default = ""
}

# Private agent node tested OSes image
variable "gcp_private_agent_dcos_instance_os" {
  default = ""
}

# Bootstrap node tested OSes image
variable "gcp_bootstrap_dcos_instance_os" {
  default = ""
}

##############################
#                            #
#  Terraform DCOS Variables  #
##############################

# Number of Masters
variable "num_masters" {
  default = "1"
}

# Number of Private Agents
variable "num_private_agents" {
  default = "1"
}

# Number of Public Agents
variable "num_public_agents" {
  default = "1"
}
