# Deployed Name Prefix
output "name_prefix" {
  description = "Cluster Name"
  value = "${var.name_prefix}"
}

# Deployed Bootstrap disk size
output "bootstrap.disk_size" {
  description = "bootstrap.disk size"
  value = "${module.bootstrap.disk_size}"
}

# Deployed Bootstrap disk type
output "bootstrap.disk_type" {
  description = "bootstrap.disk type"
  value = "${module.bootstrap.disk_type}"
}

# Deployed bootstrap machine type
output "bootstrap.instance_type" {
  description = "bootstrap.instance type"
  value = "${module.bootstrap.instance_type}"
}

# Deployed bootstrap image
output "bootstrap.image" {
  description = "bootstrap.image"
  value = "${module.bootstrap.image}"
}

# Deployed bootstrap agent SSH user
output "bootstrap.admin_username" {
  description = "bootstrap.admin username"
  value = "${module.bootstrap.admin_username}"
}

# Returns the ID of the prereq script
output "bootstrap.prereq_id" {
  description = "bootstrap.prereq id"
  value = "${module.bootstrap.prereq_id}"
}

# Number of Masters
output "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
  value = "${var.num_masters}"
}

# Deployed master disk size
output "masters.disk_size" {
  description = "masters.disk size"
  value = "${module.masters.disk_size}"
} # 

# Deployed master disk type
output "masters.disk_type" {
  description = "masters.disk type"
  value = "${module.masters.disk_type}"
}

# Deployed master machine type
output "masters.instance_type" {
  description = "masters.instance type"
  value = "${module.masters.instance_type}"
}

# Deployed master image
output "masters.image" {
  description = "masters.image"
  value = "${module.masters.image}"
}

# Deployed masters agent SSH user
output "masters.admin_username" {
  description = "masters.admin username"
  value = "${module.masters.admin_username}"
}

# Returns the ID of the prereq script
output "masters.prereq_id" {
  description = "masters.prereq id"
  value = "${module.masters.prereq_id}"
}

# Master Load Balancer Address
output "masters.lb.fqdn" {
  description = "masters.lb.fqdn"
  value = "${module.masters.lb.fqdn}"
}

# Number of private agents
output "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
  value = "${var.num_private_agents}"
}

# Deployed private agent disk size
output "private_agents.disk_size" {
  description = "private agents.disk size"
  value = "${module.private_agents.disk_size}"
}

# Deployed private agent disk type
output "private_agents.disk_type" {
  description = "private agents.disk type"
  value = "${module.private_agents.disk_type}"
}

# Deployed private agent machine type
output "private_agents.instance_type" {
  description = "private agents.instance type"
  value = "${module.private_agents.instance_type}"
}

# Deployed private agent image
output "private_agents.image" {
  description = "private agents.image"
  value = "${module.private_agents.image}"
}

# Deployed private agent SSH user
output "private_agents.admin_username" {
  description = "private agents.admin username"
  value = "${module.private_agents.admin_username}"
}

# Returns the ID of the prereq script
output "private_agents.prereq_id" {
  description = "private agents.prereq id"
  value = "${module.private_agents.prereq_id}"
}

# Number of public agents
output "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
  value = "${var.num_public_agents}"
}

# Deployed public agent disk size
output "public_agents.disk_size" {
  description = "public agents.disk size"
  value = "${module.public_agents.disk_size}"
}

# Deployed public agent disk type
output "public_agents.disk_type" {
  description = "public agents.disk type"
  value = "${module.public_agents.disk_type}"
}

# Deployed public agent machine type
output "public_agents.instance_type" {
  description = "public agents.instance type"
  value = "${module.public_agents.instance_type}"
}

# provided public agent OS image
output "public_agents.image" {
  description = "public agents.image"
  value = "${module.public_agents.image}"
}

# Deployed public agent SSH user
output "public_agents.admin_username" {
  description = "public agents.admin username"
  value = "${module.public_agents.admin_username}"
}

# Public Agent Load Balancer Address
output "public_agents.lb.fqdn" {
  description = "public agents.lb.fqdn"
  value = "${module.public_agents.lb.fqdn}"
}

# Returns the ID of the prereq script
output "public_agents.prereq_id" {
  description = "public agents.prereq id"
  value = "${module.public_agents.prereq_id}"
}

# Azure Region
output "location" {
  description = "location"
  value = "${var.location}"
}

# Bootstrap private ip
output "bootstrap.private_ip" {
  description = "Private IP of the bootstrap instance"
  value = "${module.bootstrap.private_ips}"
}

# Bootstrap public ip
output "bootstrap.public_ip" {
  description = "Public IP of the bootstrap instance"
  value = "${module.bootstrap.public_ips}"
}

# masters public ip
output "masters.public_ips" {
  description = "Master instances public IPs"
  value = "${module.masters.public_ips}"
}

# masters private ip
output "masters.private_ips" {
  description = "Master instances private IPs"
  value = "${module.masters.private_ips}"
}

# private_agent public ip
output "private_agents.public_ips" {
  description = "Private Agent public IPs"
  value = "${module.private_agents.public_ips}"
}

# private_agent private ip
output "private_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value = "${module.private_agents.private_ips}"
}

# public_agent public ip
output "public_agents.public_ips" {
  description = "Private Agent public IPs"
  value = "${module.public_agents.public_ips}"
}

# public_agent private ip
output "public_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value = "${module.public_agents.private_ips}"
}

# Master node tested OSes image
output "masters.dcos_instance_os" {
  description = "masters.dcos instance os"
  value = "${module.masters.dcos_instance_os}"
}

# Public Agent node tested OSes image
output "public_agents.dcos_instance_os" {
  description = "public agents.dcos instance os"
  value = "${module.public_agents.dcos_instance_os}"
}

# Private agent node tested OSes image
output "private_agents.dcos_instance_os" {
  description = "private agents.dcos instance os"
  value = "${module.private_agents.dcos_instance_os}"
}

# Bootstrap node tested OSes image
output "bootstrap.dcos_instance_os" {
  description = "bootstrap.dcos instance os"
  value = "${module.bootstrap.dcos_instance_os}"
}

# DCOS Version
output "dcos_version" {
  description = "Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list."
  value = "${var.dcos_version}"
}
