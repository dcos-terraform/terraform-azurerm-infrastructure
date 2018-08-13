provider "google" {
 region = "${var.gcp_region}"
}

resource "random_id" "id" {
 byte_length = 4
 prefix      = "${var.cluster_name}-"
}

resource "google_project" "project" {
 count = "${ var.gcp_project_id == "" ? "1" : "0" }"
 name            = "${var.cluster_name}"
 project_id      = "${random_id.id.hex}"
 billing_account = "${var.gcp_billing_account}"
 org_id          = "${var.gcp_org_id}"
}

resource "google_project_services" "project" {
 project = "${google_project.project.project_id}"
 services = [
   "compute.googleapis.com"
 ]
}

data "google_compute_zones" "available" { project = "${coalesce(var.gcp_project_id, google_project.project.project_id)}" }

module "network" {
  source = "../terraform-gcp-network"

  # version = "0.0.0"

  gcp_region        = "${var.gcp_region}"
  master_cidr_range = "10.10.0.0/16"
  agent_cidr_range  = "10.11.0.0/16"
  cluster_name      = "${var.cluster_name}"
}

module "bootstrap" {
  source = "../terraform-gcp-bootstrap"

  # version = "0.0.0"

  disk_size                 = "${coalesce(var.gcp_bootstrap_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.gcp_bootstrap_disk_type, var.infra_disk_type)}"
  machine_type              = "${coalesce(var.gcp_bootstrap_gce_type, var.infra_machine_type)}"
  cluster_name              = "${var.cluster_name}"
  public_ssh_key            = "${coalesce(var.gcp_bootstrap_public_ssh_key, var.infra_public_ssh_key)}"
  ssh_user                  = "${coalesce(var.gcp_bootstrap_ssh_user, var.infra_ssh_user)}"
  bootstrap_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                     = "${var.gcp_bootstrap_image}"
  dcos_instance_os = "${coalesce(var.gcp_bootstrap_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
}

module "masters" {
  source = "../terraform-gcp-masters"

  # version = "0.0.0"

  num_masters            = "${var.num_masters}"
  disk_size              = "${coalesce(var.gcp_master_disk_size, var.infra_disk_size)}"
  disk_type              = "${coalesce(var.gcp_master_disk_type, var.infra_disk_type)}"
  machine_type           = "${coalesce(var.gcp_master_gce_type, var.infra_machine_type)}"
  cluster_name           = "${var.cluster_name}"
  public_ssh_key         = "${coalesce(var.gcp_master_public_ssh_key, var.infra_public_ssh_key)}"
  ssh_user               = "${coalesce(var.gcp_master_ssh_user, var.infra_ssh_user)}"
  master_subnetwork_name = "${module.network.master_subnetwork_name}"
  image                  = "${var.gcp_master_image}"
  dcos_instance_os = "${coalesce(var.gcp_master_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = ["${data.google_compute_zones.available.names}"]
}

module "private-agent" {
  source = "../terraform-gcp-private-agents"

  # version = "0.0.0"

  num_private_agents            = "${var.num_private_agents}"
  disk_size                     = "${coalesce(var.gcp_private_agent_disk_size, var.infra_disk_size)}"
  disk_type                     = "${coalesce(var.gcp_private_agent_disk_type, var.infra_disk_type)}"
  machine_type                  = "${coalesce(var.gcp_private_agent_gce_type, var.infra_machine_type)}"
  cluster_name                  = "${var.cluster_name}"
  public_ssh_key                = "${coalesce(var.gcp_private_agent_public_ssh_key, var.infra_public_ssh_key)}"
  ssh_user                      = "${coalesce(var.gcp_private_agent_ssh_user, var.infra_ssh_user)}"
  private_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                         = "${var.gcp_private_agent_image}"
  dcos_instance_os = "${coalesce(var.gcp_priave_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = ["${data.google_compute_zones.available.names}"]
}

module "public-agent" {
  source = "../terraform-gcp-public-agents"

  # version = "0.0.0"

  num_public_agents            = "${var.num_public_agents}"
  disk_size                    = "${coalesce(var.gcp_public_agent_disk_size, var.infra_disk_size)}"
  disk_type                    = "${coalesce(var.gcp_public_agent_disk_type, var.infra_disk_type)}"
  machine_type                 = "${coalesce(var.gcp_public_agent_gce_type, var.infra_machine_type)}"
  cluster_name                 = "${var.cluster_name}"
  public_ssh_key               = "${coalesce(var.gcp_public_agent_public_ssh_key, var.infra_public_ssh_key)}"
  ssh_user                     = "${coalesce(var.gcp_public_agent_ssh_user, var.infra_ssh_user)}"
  public_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                        = "${var.gcp_public_agent_image}"
  dcos_instance_os = "${coalesce(var.gcp_public_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  # Determine if we need to force a particular region
  zone_list = ["${data.google_compute_zones.available.names}"]
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

