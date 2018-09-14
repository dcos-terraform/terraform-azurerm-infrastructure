provider "azurerm" {
  #location = "${var.location}"
}

resource "random_id" "id" {
  byte_length = 2
  prefix      = "${var.name_prefix}-tf"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "dcos-${random_id.id.hex}"
  location = "${var.location}"
}

module "network" {
  source  = "dcos-terraform/vnet/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  location     = "${var.location}"
  public_cidr  = "${var.public_cidr}"
  private_cidr = "${var.private_cidr}"
  name_prefix  = "${random_id.id.hex}"

  #  network_security_group_id = "${module.network.network_security_group_id}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

module "bootstrap" {
  source  = "dcos-terraform/bootstrap/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = "azurerm"
  }

  location            = "${var.location}"
  disk_size           = "${coalesce(var.bootstrap_disk_size, var.infra_disk_size)}"
  disk_type           = "${coalesce(var.bootstrap_disk_type, var.infra_disk_type)}"
  instance_type       = "${coalesce(var.bootstrap_instance_type, var.infra_instance_type)}"
  name_prefix         = "${random_id.id.hex}"
  public_ssh_key      = "${coalesce(var.bootstrap_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  admin_username      = "${coalesce(var.bootstrap_admin_username, var.infra_admin_username)}"
  image               = "${var.bootstrap_image}"
  dcos_instance_os    = "${coalesce(var.bootstrap_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  subnet_id           = "${module.network.private_subnet_id}"

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

  num_masters         = "${var.num_masters}"
  location            = "${var.location}"
  disk_size           = "${coalesce(var.master_disk_size, var.infra_disk_size)}"
  disk_type           = "${coalesce(var.master_disk_type, var.infra_disk_type)}"
  instance_type       = "${coalesce(var.master_instance_type, var.infra_instance_type)}"
  name_prefix         = "${random_id.id.hex}"
  public_ssh_key      = "${coalesce(var.master_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  admin_username      = "${coalesce(var.master_admin_username, var.infra_admin_username)}"
  image               = "${var.master_image}"
  dcos_instance_os    = "${coalesce(var.master_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  subnet_id           = "${module.network.public_subnet_id}"

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

  num_private_agents  = "${var.num_private_agents}"
  location            = "${var.location}"
  disk_size           = "${coalesce(var.private_agent_disk_size, var.infra_disk_size)}"
  disk_type           = "${coalesce(var.private_agent_disk_type, var.infra_disk_type)}"
  instance_type       = "${coalesce(var.private_agent_instance_type, var.infra_instance_type)}"
  name_prefix         = "${random_id.id.hex}"
  public_ssh_key      = "${coalesce(var.private_agent_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  admin_username      = "${coalesce(var.private_agent_admin_username, var.infra_admin_username)}"
  image               = "${var.private_agent_image}"
  dcos_instance_os    = "${coalesce(var.private_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  subnet_id           = "${module.network.private_subnet_id}"

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

  num_public_agents   = "${var.num_public_agents}"
  location            = "${var.location}"
  disk_size           = "${coalesce(var.public_agent_disk_size, var.infra_disk_size)}"
  disk_type           = "${coalesce(var.public_agent_disk_type, var.infra_disk_type)}"
  instance_type       = "${coalesce(var.public_agent_instance_type, var.infra_instance_type)}"
  name_prefix         = "${random_id.id.hex}"
  public_ssh_key      = "${coalesce(var.public_agent_public_ssh_key_path, var.infra_public_ssh_key_path)}"
  admin_username      = "${coalesce(var.public_agent_admin_username, var.infra_admin_username)}"
  image               = "${var.public_agent_image}"
  dcos_instance_os    = "${coalesce(var.public_agent_dcos_instance_os, var.infra_dcos_instance_os)}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  subnet_id           = "${module.network.public_subnet_id}"

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

