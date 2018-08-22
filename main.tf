data "google_compute_zones" "available" {}

provider "google" {
  credentials = "${file(var.gcp_credentials_path_json)}"
  region      = "${var.gcp_region}"
  project     = "${var.gcp_project_id}"
}

resource "random_id" "id" {
  byte_length = 2
  prefix      = "${var.name_prefix}-tf"
}

module "network" {
  source = "../terraform-gcp-network"

  # version = "0.0.0"

  providers = {
    google = "google"
  }
  gcp_region        = "${var.gcp_region}"
  master_cidr_range = "10.10.0.0/16"
  agent_cidr_range  = "10.11.0.0/16"
  name_prefix       = "${random_id.id.hex}"
  project_id        = "${var.gcp_project_id}"
}

module "bootstrap" {
  source = "../terraform-gcp-bootstrap"

  # version = "0.0.0"

  providers = {
    google = "google"
  }
  disk_size                 = "${coalesce(var.gcp_bootstrap_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.gcp_bootstrap_disk_type, var.infra_disk_type)}"
  machine_type              = "${coalesce(var.gcp_bootstrap_machine_type, var.infra_machine_type)}"
  name_prefix               = "${random_id.id.hex}"
  public_ssh_key            = "${coalesce(var.gcp_bootstrap_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user                  = "${coalesce(var.gcp_bootstrap_ssh_user, var.infra_ssh_user)}"
  bootstrap_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                     = "${var.gcp_bootstrap_image}"
  dcos_instance_os          = "${coalesce(var.gcp_bootstrap_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
  dcos_version             = "${var.dcos_version}"
}

module "masters" {
  source = "../terraform-gcp-masters"

  # version = "0.0.0"

  providers = {
    google = "google"
  }
  num_masters            = "${var.num_masters}"
  disk_size              = "${coalesce(var.gcp_master_disk_size, var.infra_disk_size)}"
  disk_type              = "${coalesce(var.gcp_master_disk_type, var.infra_disk_type)}"
  machine_type           = "${coalesce(var.gcp_master_machine_type, var.infra_machine_type)}"
  name_prefix            = "${random_id.id.hex}"
  public_ssh_key         = "${coalesce(var.gcp_master_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user               = "${coalesce(var.gcp_master_ssh_user, var.infra_ssh_user)}"
  master_subnetwork_name = "${module.network.master_subnetwork_name}"
  image                  = "${var.gcp_master_image}"
  dcos_instance_os       = "${coalesce(var.gcp_master_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
  dcos_version             = "${var.dcos_version}"
}

module "private-agent" {
  source = "../terraform-gcp-private-agents"

  # version = "0.0.0"

  providers = {
    google = "google"
  }
  num_private_agents            = "${var.num_private_agents}"
  disk_size                     = "${coalesce(var.gcp_private_agent_disk_size, var.infra_disk_size)}"
  disk_type                     = "${coalesce(var.gcp_private_agent_disk_type, var.infra_disk_type)}"
  machine_type                  = "${coalesce(var.gcp_private_agent_machine_type, var.infra_machine_type)}"
  name_prefix                   = "${random_id.id.hex}"
  public_ssh_key                = "${coalesce(var.gcp_private_agent_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user                      = "${coalesce(var.gcp_private_agent_ssh_user, var.infra_ssh_user)}"
  private_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                         = "${var.gcp_private_agent_image}"
  dcos_instance_os              = "${coalesce(var.gcp_private_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
  dcos_version             = "${var.dcos_version}"
}

module "public-agent" {
  source = "../terraform-gcp-public-agents"

  # version = "0.0.0"

  providers = {
    google = "google"
  }
  num_public_agents            = "${var.num_public_agents}"
  disk_size                    = "${coalesce(var.gcp_public_agent_disk_size, var.infra_disk_size)}"
  disk_type                    = "${coalesce(var.gcp_public_agent_disk_type, var.infra_disk_type)}"
  machine_type                 = "${coalesce(var.gcp_public_agent_machine_type, var.infra_machine_type)}"
  name_prefix                  = "${random_id.id.hex}"
  public_ssh_key               = "${coalesce(var.gcp_public_agent_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  ssh_user                     = "${coalesce(var.gcp_public_agent_ssh_user, var.infra_ssh_user)}"
  public_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                        = "${var.gcp_public_agent_image}"
  dcos_instance_os             = "${coalesce(var.gcp_public_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
  dcos_version             = "${var.dcos_version}"
}

#####################################
#                                   #
#  Terraform DCOS Layer             #
#####################################


#module "terraform-dcos-ssh" {
#  source = "../terraform-dcos-ssh"
#
#  # version = "0.0.0"
#}

