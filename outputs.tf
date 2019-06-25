output "bootstrap.os_user" {
  description = "Bootstrap node SSH User"
  value       = "${module.bootstrap.os_user}"
}

output "masters.os_user" {
  description = "Masters node SSH User"
  value       = "${module.masters.os_user}"
}

output "private_agents.os_user" {
  description = "Private Agents node SSH User"
  value       = "${module.private_agents.os_user}"
}

output "public_agents.os_user" {
  description = "Public Agents node SSH User"
  value       = "${module.public_agents.os_user}"
}

output "bootstrap.private_ip" {
  description = "Private IP of the bootstrap instance"
  value       = "${module.bootstrap.private_ip}"
}

output "bootstrap.public_ip" {
  description = "Public IP of the bootstrap instance"
  value       = "${module.bootstrap.public_ip}"
}

output "masters.public_ips" {
  description = "Master instances public IPs"
  value       = "${module.masters.public_ips}"
}

output "masters.private_ips" {
  description = "Master instances private IPs"
  value       = "${module.masters.private_ips}"
}

output "private_agents.public_ips" {
  description = "Private Agent public IPs"
  value       = "${module.private_agents.public_ips}"
}

output "private_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value       = "${module.private_agents.private_ips}"
}

output "public_agents.public_ips" {
  description = "Public Agent public IPs"
  value       = "${module.public_agents.public_ips}"
}

output "public_agents.private_ips" {
  description = "Public Agent instances private IPs"
  value       = "${module.public_agents.private_ips}"
}

output "lb.masters" {
  description = "lb address"
  value       = "${module.loadbalancers.masters.lb_address}"
}

output "lb.masters-internal" {
  description = "lb address"
  value       = "${module.loadbalancers.masters-internal.lb_address}"
}

output "lb.public-agents" {
  description = "lb address"
  value       = "${module.loadbalancers.public-agents.lb_address}"
}

output "azurerm_storage_key" {
  description = "Azure Storage Account Access Keys for External Exhibitor"
  value       = "${join(",", flatten(azurerm_storage_account.external_exhibitor.*.primary_access_key))}"
}

output "vnet_id" {
  description = "ID of the VNET"
  value       = "${module.network.vnet_id}"
}

output "vnet_name" {
  description = "Name of the VNET"
  value       = "${module.network.vnet_name}"
}

output "rg_name" {
  description = "Name of the Resource group"
  value       = "${azurerm_resource_group.rg.name}"
}
