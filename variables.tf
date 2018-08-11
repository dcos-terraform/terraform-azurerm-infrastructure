#
variable "cluster_name" {}

#
variable "gcp_bootstrap_disk_size" { default = "" }

#
variable "gcp_bootstrap_disk_type" { default = "" }

#
variable "gcp_bootstrap_gce_type" { default = "" }

#
variable "gcp_bootstrap_image" { default = "" }

#
variable "gcp_master_disk_size" { default = "" }

#
variable "gcp_master_disk_type" { default = "" }

#
variable "gcp_master_gce_type" { default = "" }

#
variable "gcp_master_image" { default = "" }

#
variable "gcp_private_agent_disk_size" { default = "" }

#
variable "gcp_private_agent_disk_type" { default = "" }

#
variable "gcp_private_agent_gce_type" { default = "" }

#
variable "gcp_private_agent_image" { default = "" }

#
variable "gcp_public_agent_disk_size" { default = "" }

#
variable "gcp_public_agent_disk_type" { default = "" }

#
variable "gcp_public_agent_gce_type" { default = "" }

#
variable "gcp_public_agent_image" { default = "" }

#
variable "gcp_master_public_ssh_key" { default = "" }

#
variable "gcp_private_agent_public_ssh_key" { default = "" }

#
variable "gcp_bootstrap_public_ssh_key" { default = "" }

#
variable "gcp_region" { default = "" }

#
variable "gcp_ssh_key" { default = "" }

#
variable "gcp_master_ssh_user" { default = "" }

#
variable "gcp_bootstrap_ssh_user" { default = "" }

#
variable "gcp_public_agent_ssh_user" { default = "" }

#
variable "gcp_public_agent_public_ssh_key" { default = "" }

#
variable "gcp_private_agent_ssh_user" { default = "" }

#
variable "infra_ssh_user" { default = "" }

#
variable "infra_public_ssh_key" { default = "" }

#
variable "infra_disk_type" { default = "" }

#
variable "infra_disk_size" { default = "" }

#
variable "infra_machine_type" { default = "" }

#
variable "infra_dcos_instance_os" { default = "" }

#
variable "gcp_master_dcos_instance_os" { default = "" }

#
variable "gcp_public_agent_dcos_instance_os" { default = "" }

#
variable "gcp_priave_agent_dcos_instance_os" { default = "" }

#
variable "gcp_bootstrap_dcos_instance_os" { default = "" }

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
