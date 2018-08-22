# Deployed Name Prefix
output "name_prefix" {
  value = "${var.name_prefix}"
}

# Deployed Bootstrap disk size
output "gcp_bootstrap_disk_size" {
  value = "${module.bootstrap.disk_size}"
}

# Deployed Bootstrap disk type
output "gcp_bootstrap_disk_type" {
  value = "${module.bootstrap.disk_type}"
}

# Deployed bootstrap machine type
output "gcp_bootstrap_machine_type" {
  value = "${module.bootstrap.machine_type}"
}

# Deployed bootstrap image
output "gcp_bootstrap_image" {
  value = "${module.bootstrap.image}"
}

# Number of Masters
output "num_masters" {
  value = "${var.num_masters}"
}

# Deployed master disk size
output "gcp_master_disk_size" {
  value = "${module.masters.disk_size}"
} # 

# Deployed master disk type
output "gcp_master_disk_type" {
  value = "${module.masters.disk_type}"
}

# Deployed master machine type
output "gcp_master_machine_type" {
  value = "${module.masters.machine_type}"
}

# Deployed master image
output "gcp_master_image" {
  value = "${module.masters.image}"
}

# Number of private agents
output "num_private_agents" {
  value = "${var.num_private_agents}"
}

# Deployed private agent disk size
output "gcp_private_agent_disk_size" {
  value = "${module.private-agent.disk_size}"
}

# Deployed private agent disk type
output "gcp_private_agent_disk_type" {
  value = "${module.private-agent.disk_type}"
}

# Deployed private agent machine type
output "gcp_private_agent_machine_type" {
  value = "${module.private-agent.machine_type}"
}

# Deployed private agent image
output "gcp_private_agent_image" {
  value = "${module.private-agent.image}"
}

# Number of public agents
output "num_public_agents" {
  value = "${var.num_public_agents}"
}

# Deployed public agent disk size
output "gcp_public_agent_disk_size" {
  value = "${module.public-agent.disk_size}"
}

# Deployed public agent disk type
output "gcp_public_agent_disk_type" {
  value = "${module.public-agent.disk_type}"
}

# Deployed public agent machine type
output "gcp_public_agent_machine_type" {
  value = "${module.public-agent.machine_type}"
}

# provided public agent OS image
output "gcp_public_agent_image" {
  value = "${module.public-agent.image}"
}

# GCP Region
output "gcp_region" {
  value = "${var.gcp_region}"
}

# Bootstrap public ip
output "bootstrap_public_ips" {
  value = "${module.bootstrap.public_ips}"
}

# Bootstrap private ip
output "bootstrap_private_ips" {
  value = "${module.bootstrap.private_ips}"
}

# masters public ip
output "masters_public_ips" {
  value = "${module.masters.public_ips}"
}

# masters private ip
output "masters_private_ips" {
  value = "${module.masters.private_ips}"
}

# private-agent public ip
output "private-agent_public_ips" {
  value = "${module.private-agent.public_ips}"
}

# private-agent private ip
output "private-agent_private_ips" {
  value = "${module.private-agent.private_ips}"
}

# public-agent public ip
output "public-agent_public_ips" {
  value = "${module.public-agent.public_ips}"
}

# public-agent private ip
output "public-agent_private_ips" {
  value = "${module.public-agent.private_ips}"
}

# Master node tested OSes image
output "gcp_master_dcos_instance_os" {
  value = "${module.masters.dcos_instance_os}"
}

# Public Agent node tested OSes image
output "gcp_public_agent_dcos_instance_os" {
  value = "${module.public-agent.dcos_instance_os}"
}

# Private agent node tested OSes image
output "gcp_private_agent_dcos_instance_os" {
  value = "${module.private-agent.dcos_instance_os}"
}

# Bootstrap node tested OSes image
output "gcp_bootstrap_dcos_instance_os" {
  value = "${module.bootstrap.dcos_instance_os}"
}

# DCOS Version
output "dcos_version" {
  value = "${var.dcos_version}"
}
