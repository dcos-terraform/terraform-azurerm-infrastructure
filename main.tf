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
 *   version = "~> 0.2.0"
 *
 *   infra_public_ssh_key_path = "~/.ssh/id_rsa.pub"
 *
 *   num_masters = "3"
 *   num_private_agents = "2"
 *   num_public_agents = "1"
 * }
 * ```
 */

data "null_data_source" "lb_rules" {
  count = "${length(var.public_agents_additional_ports)}"

  inputs = {
    frontend_port = "${element(var.public_agents_additional_ports, count.index)}"
  }
}

provider "azurerm" {}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "dcos-${var.cluster_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "network" {
  source  = "dcos-terraform/vnet/azurerm"
  version = "~> 0.2.0"

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
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  location                       = "${var.location}"
  subnet_range                   = "${var.subnet_range}"
  cluster_name                   = "${var.cluster_name}"
  admin_ips                      = ["${var.admin_ips}"]
  public_agents_additional_ports = ["${var.public_agents_additional_ports}"]

  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags                = "${var.tags}"
}

// If External Exhibitor is Specified, Create a Storage Account
resource "azurerm_storage_account" "external_exhibitor" {
  count                    = "${var.azurerm_storage_account_name != "" ? 1 : 0}"
  name                     = "${var.azurerm_storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = "${var.tags}"
}

module "loadbalancers" {
  source  = "dcos-terraform/lb-dcos/azurerm"
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  location                             = "${var.location}"
  cluster_name                         = "${var.cluster_name}"
  subnet_id                            = "${module.network.subnet_id}"
  public_agents_additional_rules       = ["${data.null_data_source.lb_rules.*.outputs}"]
  masters_instance_nic_ids             = ["${module.masters.instance_nic_ids}"]
  public_agents_instance_nic_ids       = ["${module.public_agents.instance_nic_ids}"]
  masters_ip_configuration_names       = ["${module.masters.ip_configuration_names}"]
  public_agents_ip_configuration_names = ["${module.public_agents.ip_configuration_names}"]
  num_masters                          = "${var.num_masters}"
  num_public_agents                    = "${var.num_public_agents}"

  resource_group_name = "${azurerm_resource_group.rg.name}"
  tags                = "${var.tags}"
}

module "bootstrap" {
  source  = "dcos-terraform/bootstrap/azurerm"
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  location                  = "${var.location}"
  disk_size                 = "${coalesce(var.bootstrap_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.bootstrap_disk_type, var.infra_disk_type)}"
  vm_size                   = "${coalesce(var.bootstrap_vm_size, var.infra_vm_size)}"
  name_prefix               = "${var.cluster_name}"
  ssh_public_key            = "${file(var.ssh_public_key_file)}"
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
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  num_masters               = "${var.num_masters}"
  location                  = "${var.location}"
  disk_size                 = "${coalesce(var.masters_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.masters_disk_type, var.infra_disk_type)}"
  vm_size                   = "${coalesce(var.masters_vm_size, var.infra_vm_size)}"
  name_prefix               = "${var.cluster_name}"
  ssh_public_key            = "${file(var.ssh_public_key_file)}"
  admin_username            = "${coalesce(var.masters_admin_username, var.infra_admin_username)}"
  image                     = "${var.masters_image}"
  dcos_instance_os          = "${coalesce(var.masters_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  subnet_id                 = "${module.network.subnet_id}"
  network_security_group_id = "${module.network-security-group.masters.nsg_id}"

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "private_agents" {
  source  = "dcos-terraform/private-agents/azurerm"
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  num_private_agents        = "${var.num_private_agents}"
  location                  = "${var.location}"
  disk_size                 = "${coalesce(var.private_agents_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.private_agents_disk_type, var.infra_disk_type)}"
  vm_size                   = "${coalesce(var.private_agents_vm_size, var.infra_vm_size)}"
  name_prefix               = "${var.cluster_name}"
  ssh_public_key            = "${file(var.ssh_public_key_file)}"
  admin_username            = "${coalesce(var.private_agents_admin_username, var.infra_admin_username)}"
  image                     = "${var.private_agents_image}"
  dcos_instance_os          = "${coalesce(var.private_agents_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  subnet_id                 = "${module.network.subnet_id}"
  network_security_group_id = "${module.network-security-group.private_agents.nsg_id}"

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}

module "public_agents" {
  source  = "dcos-terraform/public-agents/azurerm"
  version = "~> 0.2.0"

  providers = {
    azurerm = "azurerm"
  }

  num_public_agents         = "${var.num_public_agents}"
  location                  = "${var.location}"
  disk_size                 = "${coalesce(var.public_agents_disk_size, var.infra_disk_size)}"
  disk_type                 = "${coalesce(var.public_agents_disk_type, var.infra_disk_type)}"
  vm_size                   = "${coalesce(var.public_agents_vm_size, var.infra_vm_size)}"
  name_prefix               = "${var.cluster_name}"
  ssh_public_key            = "${file(var.ssh_public_key_file)}"
  admin_username            = "${coalesce(var.public_agents_admin_username, var.infra_admin_username)}"
  image                     = "${var.public_agents_image}"
  dcos_instance_os          = "${coalesce(var.public_agents_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  subnet_id                 = "${module.network.subnet_id}"
  network_security_group_id = "${module.network-security-group.public_agents.nsg_id}"

  # Determine if we need to force a particular location
  dcos_version = "${var.dcos_version}"
  tags         = "${var.tags}"
}
