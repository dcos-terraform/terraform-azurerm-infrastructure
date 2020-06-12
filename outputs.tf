output "bootstrap_admin_username" {
  description = "Bootstrap instance OS default user"
  value       = module.bootstrap.admin_username
}

output "masters_admin_username" {
  description = "Master instances OS default user"
  value       = module.masters.admin_username
}

output "private_agents_admin_username" {
  description = "Private Agent instances OS default user"
  value       = module.private_agents.admin_username
}

output "public_agents_admin_username" {
  description = "Public Agent instances OS default user"
  value       = module.public_agents.admin_username
}

output "bootstrap_private_ip" {
  description = "Private IP of the bootstrap instance"
  value       = module.bootstrap.private_ip
}

output "bootstrap_public_ip" {
  description = "Public IP of the bootstrap instance"
  value       = module.bootstrap.public_ip
}

output "bootstrap_nsg_id" {
  description = "Network security group id of the bootstrap"
  value       = module.network-security-group.bootstrap_nsg_id
}

output "masters_public_ips" {
  description = "Master instances public IPs"
  value       = module.masters.public_ips
}

output "masters_private_ips" {
  description = "Master instances private IPs"
  value       = module.masters.private_ips
}

output "masters_nsg_id" {
  description = "Network security group id of the masters"
  value       = module.network-security-group.masters_nsg_id
}

output "private_agents_public_ips" {
  description = "Private Agent public IPs"
  value       = module.private_agents.public_ips
}

output "private_agents_private_ips" {
  description = "Private Agent instances private IPs"
  value       = module.private_agents.private_ips
}

output "private_agents_nsg_id" {
  description = "Network security group id of the private agents"
  value       = module.network-security-group.private_agents_nsg_id
}

output "public_agents_public_ips" {
  description = "Public Agent public IPs"
  value       = module.public_agents.public_ips
}

output "public_agents_private_ips" {
  description = "Public Agent instances private IPs"
  value       = module.public_agents.private_ips
}

output "public_agents_nsg_id" {
  description = "Network security group id of the public agents"
  value       = module.network-security-group.public_agents_nsg_id
}

output "lb_masters" {
  description = "lb address"
  value       = module.loadbalancers.masters_lb_address
}

output "lb_masters-internal" {
  description = "lb address"
  value       = module.loadbalancers.masters-internal_lb_address
}

output "lb_public-agents" {
  description = "lb address"
  value       = module.loadbalancers.public-agents_lb_address
}

output "azurerm_storage_key" {
  description = "Azure Storage Account Access Keys for External Exhibitor"
  value = join(
    ",",
    flatten(
      azurerm_storage_account.external_exhibitor.*.primary_access_key,
    ),
  )
}

output "vnet_id" {
  description = "ID of the VNET"
  value       = module.network.vnet_id
}

output "vnet_name" {
  description = "Name of the VNET"
  value       = module.network.vnet_name
}

output "resource_group_name" {
  description = "Name of the azure resource group"
  value       = azurerm_resource_group.rg.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.network.subnet_id
}
