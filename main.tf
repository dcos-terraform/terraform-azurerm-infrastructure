/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-infrastructure/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-infrastructure/job/master/)
 * # DC/OS Azure Infrastucture
 *
 * This module creates typical DS/OS infrastructure in Azure.
 *
 * ## EXAMPLE
 *
 * ```hcl
 * module "dcos-infrastructure" {
 *   source  = "terraform-dcos/infrastructure/azurerm"
 *   version = "~> 0.1"
 *
 *   infra_public_ssh_key_path = "~/.ssh/id_rsa.pub"
 *
 *   num_masters = "3"
 *   num_private_agents = "2"
 *   num_public_agents = "1"
 * }
 * ```
 */

provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "dcos-${var.cluster_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "network" {
  source  = "dcos-terraform/vnet/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  subnet_range = "${var.subnet_range}"
  cluster_name = "${var.cluster_name}"
  location     = "${var.location}"

  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags                = "${var.tags}"
}

module "network-security-group" {
  source  = "dcos-terraform/nsg/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  location     = "${var.location}"
  subnet_range = "${var.subnet_range}"
  cluster_name = "${var.cluster_name}"
  admin_ips    = ["${var.admin_ips}"]

  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags                = "${var.tags}"
}

module "loadbalancers" {
  source  = "dcos-terraform/lb-dcos/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  location     = "${var.location}"
  cluster_name = "${var.cluster_name}"
  subnet_id    = "${module.network.subnet_id}"

  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags                = "${var.tags}"
}

module "bootstrap" {
  source  = "dcos-terraform/bootstrap/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  location                  = "${var.location}"
  disk_size                 = "${coalesce(var.bootstrap_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.bootstrap_disk_type, var.infra_disk_type)}"
  instance_type             = "${coalesce(var.bootstrap_instance_type, var.infra_instance_type)}"
  name_prefix               = "${var.cluster_name}"
  public_ssh_key            = "${var.ssh_public_key_file}"
  admin_username            = "${coalesce(var.bootstrap_admin_username, var.infra_admin_username)}"
  image                     = "${var.bootstrap_image}"
  dcos_instance_os          = "${coalesce(var.bootstrap_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  subnet_id                 = "${module.network.subnet_id}"
  network_security_group_id = "${module.network-security-group.bootstrap.nsg_id}"

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "masters" {
  source  = "dcos-terraform/masters/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  num_masters                  = "${var.num_masters}"
  location                     = "${var.location}"
  disk_size                    = "${coalesce(var.master_disk_size, var.infra_disk_size)}"
  disk_type                    = "${coalesce(var.master_disk_type, var.infra_disk_type)}"
  instance_type                = "${coalesce(var.master_instance_type, var.infra_instance_type)}"
  name_prefix                  = "${var.cluster_name}"
  public_ssh_key               = "${var.ssh_public_key_file}"
  admin_username               = "${coalesce(var.master_admin_username, var.infra_admin_username)}"
  image                        = "${var.master_image}"
  dcos_instance_os             = "${coalesce(var.master_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  subnet_id                    = "${module.network.subnet_id}"
  network_security_group_id    = "${module.network-security-group.masters.nsg_id}"
  public_backend_address_pool  = ["${module.loadbalancers.masters.backend_address_pool}"]
  private_backend_address_pool = ["${module.loadbalancers.masters-internal.backend_address_pool}"]

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "private_agents" {
  source  = "dcos-terraform/private-agents/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  num_private_agents        = "${var.num_private_agents}"
  location                  = "${var.location}"
  disk_size                 = "${coalesce(var.private_agent_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.private_agent_disk_type, var.infra_disk_type)}"
  instance_type             = "${coalesce(var.private_agent_instance_type, var.infra_instance_type)}"
  name_prefix               = "${var.cluster_name}"
  public_ssh_key            = "${var.ssh_public_key_file}"
  admin_username            = "${coalesce(var.private_agent_admin_username, var.infra_admin_username)}"
  image                     = "${var.private_agent_image}"
  dcos_instance_os          = "${coalesce(var.private_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  subnet_id                 = "${module.network.subnet_id}"
  network_security_group_id = "${module.network-security-group.private_agents.nsg_id}"

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "public_agents" {
  source  = "dcos-terraform/public-agents/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  num_public_agents           = "${var.num_public_agents}"
  location                    = "${var.location}"
  disk_size                   = "${coalesce(var.public_agent_disk_size, var.infra_disk_size)}"
  disk_type                   = "${coalesce(var.public_agent_disk_type, var.infra_disk_type)}"
  instance_type               = "${coalesce(var.public_agent_instance_type, var.infra_instance_type)}"
  name_prefix                 = "${var.cluster_name}"
  public_ssh_key              = "${var.ssh_public_key_file}"
  admin_username              = "${coalesce(var.public_agent_admin_username, var.infra_admin_username)}"
  image                       = "${var.public_agent_image}"
  dcos_instance_os            = "${coalesce(var.public_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name         = "${azurerm_resource_group.rg.name}"
  subnet_id                   = "${module.network.subnet_id}"
  network_security_group_id   = "${module.network-security-group.public_agents.nsg_id}"
  public_backend_address_pool = ["${module.loadbalancers.public-agents.backend_address_pool}"]

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

#####################################
#                                   #
#  Terraform DCOS Layer             #
#####################################


#module "terraform-dcos-ssh" {
#  source = "../terraform-dcos-ssh"
#  version = "~> 0.0"
#}

