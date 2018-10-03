[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-infrastructure/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-infrastructure/job/master/)
# DC/OS GCP Infrastucture

This module creates typical DS/OS infrastructure in AWS.

## EXAMPLE

```hcl
module "dcos-infrastructure" {
  source  = "terraform-dcos/infrastructure/azurerm"
  version = "~> 0.1"

  infra_public_ssh_key_path = "~/.ssh/id_rsa.pub"

  num_masters = "3"
  num_private_agents = "2"
  num_public_agents = "1"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bootstrap_admin_username | bootstrap admin username | string | `` | no |
| bootstrap_dcos_instance_os | bootstrap dcos instance os | string | `` | no |
| bootstrap_disk_size | bootstrap disk size | string | `` | no |
| bootstrap_disk_type | bootstrap disk type | string | `` | no |
| bootstrap_image | bootstrap image | string | `` | no |
| bootstrap_instance_type | [BOOTSTRAP] Instance type | string | `` | no |
| bootstrap_public_ssh_key_path | bootstrap public ssh key path | string | `` | no |
| dcos_version | Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list. | string | `1.11.4` | no |
| infra_admin_username | infra admin username | string | `dcos_admin` | no |
| infra_dcos_instance_os | infra dcos instance os | string | `` | no |
| infra_disk_size | infra disk size | string | `128` | no |
| infra_disk_type | infra disk type | string | `Standard_LRS` | no |
| infra_instance_type | infra instance type | string | `Standard_DS11_v2` | no |
| infra_public_ssh_key_path | infra public ssh key path | string | `` | no |
| location | location | string | `` | no |
| master_admin_username | master admin username | string | `` | no |
| master_dcos_instance_os | master dcos instance os | string | `` | no |
| master_disk_size | master disk size | string | `` | no |
| master_disk_type | master disk type | string | `` | no |
| master_image | master image | string | `` | no |
| master_instance_type | master instance type | string | `` | no |
| master_public_ssh_key_path | master public ssh key path | string | `` | no |
| name_prefix | Cluster Name | string | - | yes |
| num_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | `3` | no |
| num_private_agents | Specify the amount of private agents. These agents will provide your main resources | string | `1` | no |
| num_public_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | `1` | no |
| private_agent_admin_username | private agent admin username | string | `` | no |
| private_agent_dcos_instance_os | private agent dcos instance os | string | `` | no |
| private_agent_disk_size | private agent disk size | string | `` | no |
| private_agent_disk_type | private agent disk type | string | `` | no |
| private_agent_image | private agent image | string | `` | no |
| private_agent_instance_type | private agent instance type | string | `` | no |
| private_agent_public_ssh_key_path | private agent public ssh key path | string | `` | no |
| private_cidr | private cidr | string | `10.32.4.0/22` | no |
| public_agent_admin_username | public agent admin username | string | `` | no |
| public_agent_dcos_instance_os | public agent dcos instance os | string | `` | no |
| public_agent_disk_size | public agent disk size | string | `` | no |
| public_agent_disk_type | public agent disk type | string | `` | no |
| public_agent_image | public agent image | string | `` | no |
| public_agent_instance_type | public agent instance type | string | `` | no |
| public_agent_public_ssh_key_path | public agent public ssh key path | string | `` | no |
| public_cidr | public cidr | string | `10.32.0.0/22` | no |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap.admin_username | Deployed bootstrap agent SSH user |
| bootstrap.dcos_instance_os | Bootstrap node tested OSes image |
| bootstrap.disk_size | Deployed Bootstrap disk size |
| bootstrap.disk_type | Deployed Bootstrap disk type |
| bootstrap.image | Deployed bootstrap image |
| bootstrap.instance_type | Deployed bootstrap machine type |
| bootstrap.prereq_id | Returns the ID of the prereq script |
| bootstrap.private_ip | Bootstrap private ip |
| bootstrap.public_ip | Bootstrap public ip |
| dcos_version | DCOS Version |
| location | Azure Region |
| masters.admin_username | Deployed masters agent SSH user |
| masters.dcos_instance_os | Master node tested OSes image |
| masters.disk_size | Deployed master disk size |
| masters.disk_type | Deployed master disk type |
| masters.image | Deployed master image |
| masters.instance_type | Deployed master machine type |
| masters.lb.fqdn | Master Load Balancer Address |
| masters.prereq_id | Returns the ID of the prereq script |
| masters.private_ips | masters private ip |
| masters.public_ips | masters public ip |
| name_prefix | Deployed Name Prefix |
| num_masters | Number of Masters |
| num_private_agents | Number of private agents |
| num_public_agents | Number of public agents |
| private_agents.admin_username | Deployed private agent SSH user |
| private_agents.dcos_instance_os | Private agent node tested OSes image |
| private_agents.disk_size | Deployed private agent disk size |
| private_agents.disk_type | Deployed private agent disk type |
| private_agents.image | Deployed private agent image |
| private_agents.instance_type | Deployed private agent machine type |
| private_agents.prereq_id | Returns the ID of the prereq script |
| private_agents.private_ips | private_agent private ip |
| private_agents.public_ips | private_agent public ip |
| public_agents.admin_username | Deployed public agent SSH user |
| public_agents.dcos_instance_os | Public Agent node tested OSes image |
| public_agents.disk_size | Deployed public agent disk size |
| public_agents.disk_type | Deployed public agent disk type |
| public_agents.image | provided public agent OS image |
| public_agents.instance_type | Deployed public agent machine type |
| public_agents.lb.fqdn | Public Agent Load Balancer Address |
| public_agents.prereq_id | Returns the ID of the prereq script |
| public_agents.private_ips | public_agent private ip |
| public_agents.public_ips | public_agent public ip |

