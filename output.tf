# Deployed Name Prefix
output "name_prefix" {
  value = "${var.name_prefix}"
}

# Deployed Bootstrap disk size
output "bootstrap.disk_size" {
  value = "${module.bootstrap.disk_size}"
}

# Deployed Bootstrap disk type
output "bootstrap.disk_type" {
  value = "${module.bootstrap.disk_type}"
}

# Deployed bootstrap machine type
output "bootstrap.instance_type" {
  value = "${module.bootstrap.instance_type}"
}

# Deployed bootstrap image
output "bootstrap.image" {
  value = "${module.bootstrap.image}"
}

# Deployed bootstrap agent SSH user
output "bootstrap.admin_username" {
  value = "${module.bootstrap.admin_username}"
}

# Number of Masters
output "num_masters" {
  value = "${var.num_masters}"
}

# Deployed master disk size
output "masters.disk_size" {
  value = "${module.masters.disk_size}"
} # 

# Deployed master disk type
output "masters.disk_type" {
  value = "${module.masters.disk_type}"
}

# Deployed master machine type
output "masters.instance_type" {
  value = "${module.masters.instance_type}"
}

# Deployed master image
output "masters.image" {
  value = "${module.masters.image}"
}

# Deployed masters agent SSH user
output "masters.admin_username" {
  value = "${module.masters.admin_username}"
}

# Master Load Balancer Address
output "masters.lb.fqdn" {
  value = "${module.masters.lb.fqdn}"
}

# Number of private agents
output "num_private_agents" {
  value = "${var.num_private_agents}"
}

# Deployed private agent disk size
output "private_agents.disk_size" {
  value = "${module.private_agents.disk_size}"
}

# Deployed private agent disk type
output "private_agents.disk_type" {
  value = "${module.private_agents.disk_type}"
}

# Deployed private agent machine type
output "private_agents.instance_type" {
  value = "${module.private_agents.instance_type}"
}

# Deployed private agent image
output "private_agents.image" {
  value = "${module.private_agents.image}"
}

# Deployed private agent SSH user
output "private_agents.admin_username" {
  value = "${module.private_agents.admin_username}"
}

# Number of public agents
output "num_public_agents" {
  value = "${var.num_public_agents}"
}

# Deployed public agent disk size
output "public_agents.disk_size" {
  value = "${module.public_agents.disk_size}"
}

# Deployed public agent disk type
output "public_agents.disk_type" {
  value = "${module.public_agents.disk_type}"
}

# Deployed public agent machine type
output "public_agents.instance_type" {
  value = "${module.public_agents.instance_type}"
}

# provided public agent OS image
output "public_agents.image" {
  value = "${module.public_agents.image}"
}

# Deployed public agent SSH user
output "public_agents.admin_username" {
  value = "${module.public_agents.admin_username}"
}

# Public Agent Load Balancer Address
output "public_agents.lb.fqdn" {
  value = "${module.public_agents.lb.fqdn}"
}

# Azure Region
output "location" {
  value = "${var.location}"
}

# Bootstrap private ip
output "bootstrap.private_ip" {
  value = "${module.bootstrap.private_ips}"
}

# Bootstrap public ip
output "bootstrap.public_ip" {
  value = "${module.bootstrap.public_ips}"
}

# masters public ip
output "masters.public_ips" {
  value = "${module.masters.public_ips}"
}

# masters private ip
output "masters.private_ips" {
  value = "${module.masters.private_ips}"
}

# private_agent public ip
output "private_agents.public_ips" {
  value = "${module.private_agents.public_ips}"
}

# private_agent private ip
output "private_agents.private_ips" {
  value = "${module.private_agents.private_ips}"
}

# public_agent public ip
output "public_agents.public_ips" {
  value = "${module.public_agents.public_ips}"
}

# public_agent private ip
output "public_agents.private_ips" {
  value = "${module.public_agents.private_ips}"
}

# Master node tested OSes image
output "masters.dcos_instance_os" {
  value = "${module.masters.dcos_instance_os}"
}

# Public Agent node tested OSes image
output "public_agents.dcos_instance_os" {
  value = "${module.public_agents.dcos_instance_os}"
}

# Private agent node tested OSes image
output "private_agents.dcos_instance_os" {
  value = "${module.private_agents.dcos_instance_os}"
}

# Bootstrap node tested OSes image
output "bootstrap.dcos_instance_os" {
  value = "${module.bootstrap.dcos_instance_os}"
}

# DCOS Version
output "dcos_version" {
  value = "${var.dcos_version}"
}
