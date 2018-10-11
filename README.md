[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-infrastructure/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-infrastructure/job/master/)
# DC/OS Azure Infrastucture

This module creates typical DS/OS infrastructure in Azure.

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
| admin_ips | List of CIDR admin IPs | list | - | yes |
| bootstrap_admin_username | bootstrap admin username | string | `` | no |
| bootstrap_dcos_instance_os | bootstrap dcos instance os | string | `` | no |
| bootstrap_disk_size | bootstrap disk size | string | `` | no |
| bootstrap_disk_type | bootstrap disk type | string | `Standard_LRS` | no |
| bootstrap_image | bootstrap image | map | `<map>` | no |
| bootstrap_public_ssh_key_path | bootstrap public ssh key path | string | `` | no |
| bootstrap_vm_size | [BOOTSTRAP] Instance type | string | `Standard_B2s` | no |
| cluster_name | Name of the DC/OS cluster | string | - | yes |
| dcos_version | Specifies which DC/OS version instruction to use. Options: 1.9.0, 1.8.8, etc. See dcos_download_path or dcos_version tree for a full list. | string | `1.11.4` | no |
| infra_admin_username | infra admin username | string | `dcos_admin` | no |
| infra_dcos_instance_os | infra dcos instance os | string | `centos_7.3` | no |
| infra_disk_size | infra disk size | string | `128` | no |
| infra_disk_type | infra disk type | string | `Standard_LRS` | no |
| infra_vm_size | infra instance type | string | `Standard_DS11_v2` | no |
| location | location | string | `` | no |
| masters_admin_username | master admin username | string | `` | no |
| masters_dcos_instance_os | master dcos instance os | string | `` | no |
| masters_disk_size | master disk size | string | `` | no |
| masters_disk_type | master disk type | string | `Standard_LRS` | no |
| masters_image | master image | map | `<map>` | no |
| masters_public_ssh_key_path | master public ssh key path | string | `` | no |
| masters_vm_size | master instance type | string | `Standard_D4s_v3` | no |
| num_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | `3` | no |
| num_private_agents | Specify the amount of private agents. These agents will provide your main resources | string | `1` | no |
| num_public_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | `1` | no |
| private_agents_admin_username | private agent admin username | string | `` | no |
| private_agents_dcos_instance_os | private agent dcos instance os | string | `` | no |
| private_agents_disk_size | private agent disk size | string | `` | no |
| private_agents_disk_type | private agent disk type | string | `Standard_LRS` | no |
| private_agents_image | private agent image | map | `<map>` | no |
| private_agents_public_ssh_key_path | private agent public ssh key path | string | `` | no |
| private_agents_vm_size | private agent instance type | string | `Standard_D4s_v3` | no |
| public_agents_admin_username | public agent admin username | string | `` | no |
| public_agents_dcos_instance_os | public agent dcos instance os | string | `` | no |
| public_agents_disk_size | public agent disk size | string | `` | no |
| public_agents_disk_type | public agent disk type | string | `Standard_LRS` | no |
| public_agents_image | public agent image | map | `<map>` | no |
| public_agents_public_ssh_key_path | public agent public ssh key path | string | `` | no |
| public_agents_vm_size | public agent instance type | string | `Standard_D4s_v3` | no |
| ssh_public_key | SSH public key in authorized keys format (e.g. 'ssh-rsa ..') to be used with the instances. Make sure you added this key to your ssh-agent. | string | `` | no |
| ssh_public_key_file | Path to SSH public key. This is mandatory but can be set to an empty string if you want to use ssh_public_key with the key as string. | string | - | yes |
| subnet_range | Private IP space to be used in CIDR format | string | `172.31.0.0/16` | no |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap.admin_username | Deployed bootstrap agent SSH user |
| bootstrap.prereq_id | Returns the ID of the prereq script |
| bootstrap.private_ip | Bootstrap private ip |
| bootstrap.public_ip | Bootstrap public ip |
| lb.masters | LB Address |
| lb.masters-internal | LB Address |
| lb.public-agents | LB Address |
| masters.admin_username | Deployed masters agent SSH user |
| masters.prereq_id | Returns the ID of the prereq script |
| masters.private_ips | masters private ip |
| masters.public_ips | masters public ip |
| private_agents.admin_username | Deployed private agent SSH user |
| private_agents.prereq_id | Returns the ID of the prereq script |
| private_agents.private_ips | private_agent private ip |
| private_agents.public_ips | private_agent public ip |
| public_agents.admin_username | Deployed public agent SSH user |
| public_agents.prereq_id | Returns the ID of the prereq script |
| public_agents.private_ips | public_agent private ip |
| public_agents.public_ips | public_agent public ip |

