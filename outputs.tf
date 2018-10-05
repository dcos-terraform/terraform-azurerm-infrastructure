# Deployed bootstrap agent SSH user
output "bootstrap.admin_username" {
  description = "bootstrap.admin username"
  value       = "${module.bootstrap.admin_username}"
}

# Returns the ID of the prereq script
output "bootstrap.prereq_id" {
  description = "bootstrap.prereq id"
  value       = "${module.bootstrap.prereq_id}"
}

# Deployed masters agent SSH user
output "masters.admin_username" {
  description = "masters.admin username"
  value       = "${module.masters.admin_username}"
}

# Returns the ID of the prereq script
output "masters.prereq_id" {
  description = "masters.prereq id"
  value       = "${module.masters.prereq_id}"
}

# Deployed private agent SSH user
output "private_agents.admin_username" {
  description = "private agents.admin username"
  value       = "${module.private_agents.admin_username}"
}

# Returns the ID of the prereq script
output "private_agents.prereq_id" {
  description = "private agents.prereq id"
  value       = "${module.private_agents.prereq_id}"
}

# Deployed public agent SSH user
output "public_agents.admin_username" {
  description = "public agents.admin username"
  value       = "${module.public_agents.admin_username}"
}

# Returns the ID of the prereq script
output "public_agents.prereq_id" {
  description = "public agents.prereq id"
  value       = "${module.public_agents.prereq_id}"
}

# Bootstrap private ip
output "bootstrap.private_ip" {
  description = "Private IP of the bootstrap instance"
  value       = "${module.bootstrap.private_ips}"
}

# Bootstrap public ip
output "bootstrap.public_ip" {
  description = "Public IP of the bootstrap instance"
  value       = "${module.bootstrap.public_ips}"
}

# masters public ip
output "masters.public_ips" {
  description = "Master instances public IPs"
  value       = "${module.masters.public_ips}"
}

# masters private ip
output "masters.private_ips" {
  description = "Master instances private IPs"
  value       = "${module.masters.private_ips}"
}

# private_agent public ip
output "private_agents.public_ips" {
  description = "Private Agent public IPs"
  value       = "${module.private_agents.public_ips}"
}

# private_agent private ip
output "private_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value       = "${module.private_agents.private_ips}"
}

# public_agent public ip
output "public_agents.public_ips" {
  description = "Private Agent public IPs"
  value       = "${module.public_agents.public_ips}"
}

# public_agent private ip
output "public_agents.private_ips" {
  description = "Private Agent instances private IPs"
  value       = "${module.public_agents.private_ips}"
}

# LB Address
output "lb.masters" {
  description = "lb address"
  value       = "${module.loadbalancers.masters.lb_address}"
}

# LB Address
output "lb.masters-internal" {
  description = "lb address"
  value       = "${module.loadbalancers.masters-internal.lb_address}"
}

# LB Address
output "lb.public-agents" {
  description = "lb address"
  value       = "${module.loadbalancers.public-agents.lb_address}"
}
