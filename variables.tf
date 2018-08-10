#
variable "cluster_name" {}

#
variable "gcp_bootstrap_disk_size" {}

#
variable "gcp_bootstrap_disk_type" {}

#
variable "gcp_bootstrap_gce_type" {}

#
variable "gcp_bootstrap_image" {}

#
variable "gcp_master_disk_size" {}

#
variable "gcp_master_disk_type" {}

#
variable "gcp_master_gce_type" {}

#
variable "gcp_master_image" {}

#
variable "gcp_private_agent_disk_size" {}

#
variable "gcp_private_agent_disk_type" {}

#
variable "gcp_private_agent_gce_type" {}

#
variable "gcp_private_agent_image" {}

#
variable "gcp_public_agent_disk_size" {}

#
variable "gcp_public_agent_disk_type" {}

#
variable "gcp_public_agent_gce_type" {}

#
variable "gcp_public_agent_image" {}

#
variable "gcp_region" {}

#
variable "gcp_ssh_key" {}

#
variable "gcp_master_ssh_user" {}

#
variable "gcp_bootstrap_ssh_user" {}

#
variable "gcp_public_agent_ssh_user" {}

#
variable "gcp_private_agent_ssh_user" {}

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
