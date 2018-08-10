data "google_compute_zones" "available" {}

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

  disk_size                 = "${var.gcp_bootstrap_disk_size}"
  disk_type                 = "${var.gcp_bootstrap_disk_type}"
  region                    = "${var.gcp_region}"
  machine_type              = "${var.gcp_bootstrap_gce_type}"
  cluster_name              = "${var.cluster_name}"
  public_ssh_key            = "${var.gcp_bootstrap_public_ssh_key}"
  ssh_user                  = "${var.gcp_bootstrap_ssh_user}"
  bootstrap_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                     = "${var.gcp_bootstrap_image}"
}

module "masters" {
  source = "../terraform-gcp-masters"

  # version = "0.0.0"

  num_masters            = "${var.num_masters}"
  disk_size              = "${var.gcp_master_disk_size}"
  disk_type              = "${var.gcp_master_disk_type}"
  region                 = "${var.gcp_region}"
  machine_type           = "${var.gcp_master_gce_type}"
  cluster_name           = "${var.cluster_name}"
  public_ssh_key         = "${var.gcp_master_public_ssh_key}"
  ssh_user               = "${var.gcp_master_ssh_user}"
  master_subnetwork_name = "${module.network.master_subnetwork_name}"
  image                  = "${var.gcp_master_image}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
}

module "private-agent" {
  source = "../terraform-gcp-private-agents"

  # version = "0.0.0"

  num_private_agents            = "${var.num_private_agents}"
  disk_size                     = "${var.gcp_private_agent_disk_size}"
  disk_type                     = "${var.gcp_private_agent_disk_type}"
  region                        = "${var.gcp_region}"
  machine_type                  = "${var.gcp_private_agent_gce_type}"
  cluster_name                  = "${var.cluster_name}"
  public_ssh_key                = "${var.gcp_private_agent_public_ssh_key}"
  ssh_user                      = "${var.gcp_private_agent_ssh_user}"
  private_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                         = "${var.gcp_private_agent_image}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
}

module "public-agent" {
  source = "../terraform-gcp-public-agents"

  # version = "0.0.0"

  num_public_agents            = "${var.num_public_agents}"
  disk_size                    = "${var.gcp_public_agent_disk_size}"
  disk_type                    = "${var.gcp_public_agent_disk_type}"
  region                       = "${var.gcp_region}"
  machine_type                 = "${var.gcp_public_agent_gce_type}"
  cluster_name                 = "${var.cluster_name}"
  public_ssh_key               = "${var.gcp_ssh_key}"
  ssh_user                     = "${var.gcp_public_agent_ssh_user}"
  public_agent_subnetwork_name = "${module.network.agent_subnetwork_name}"
  image                        = "${var.gcp_public_agent_image}"
  # Determine if we need to force a particular region
  zone_list = "${data.google_compute_zones.available.names}"
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

