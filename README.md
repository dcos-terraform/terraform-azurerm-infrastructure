# DC/OS GCP Infrastucture

Creates DC/OS Infrastructure for Azure


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bootstrap_admin_username | Bootstrap node SSH User | string | `` | no |
| bootstrap_dcos_instance_os | Bootstrap node tested OSes image | string | `` | no |
| bootstrap_disk_size | Bootstrap node disk size (gb) | string | `` | no |
| bootstrap_disk_type | Bootstrap node disk type. | string | `` | no |
| bootstrap_image | Bootstrap node OS image | string | `` | no |
| bootstrap_instance_type | Bootstrap node machine type | string | `` | no |
| bootstrap_public_ssh_key_path | Bootstrap Node Public SSH Key | string | `` | no |
| dcos_version | DCOS Version | string | `1.11.4` | no |
| infra_admin_username | Global Infra SSH User | string | `` | no |
| infra_dcos_instance_os | Global Infra Tested OSes Image | string | `` | no |
| infra_disk_size | Global Infra Disk Size | string | `128` | no |
| infra_disk_type | Global Infra Disk Type | string | `Standard_LRS` | no |
| infra_instance_type | Global Infra Machine Type | string | `Standard_DS11_v2` | no |
| infra_public_ssh_key_path | Global Infra Public SSH Key | string | `` | no |
| location | Azure Region | string | `` | no |
| master_admin_username | Master node SSH User | string | `` | no |
| master_dcos_instance_os | Master node tested OSes image | string | `` | no |
| master_disk_size | Master node disk size (gb) | string | `` | no |
| master_disk_type | Master node disk type. | string | `` | no |
| master_image | Master node OS image | string | `` | no |
| master_instance_type | Master node machine type | string | `` | no |
| master_public_ssh_key_path | Master node Public SSH Key | string | `` | no |
| name_prefix |  | string | - | yes |
| num_masters | Number of Masters | string | `3` | no |
| num_private_agents | Number of Private Agents | string | `1` | no |
| num_public_agents | Number of Public Agents | string | `1` | no |
| private_agent_admin_username | Private Agent ndoe SSH User | string | `` | no |
| private_agent_dcos_instance_os | Private agent node tested OSes image | string | `` | no |
| private_agent_disk_size | Private agent node disk size (gb) | string | `` | no |
| private_agent_disk_type | Private agent node disk type. | string | `` | no |
| private_agent_image | Private agent node OS image | string | `` | no |
| private_agent_instance_type | Private agent node machine type | string | `` | no |
| private_agent_public_ssh_key_path | Private Agent node Public SSH Key | string | `` | no |
| private_cidr | Agent CIDR Range | string | `10.32.4.0/22` | no |
| public_agent_admin_username | Public Agent node SSH User | string | `` | no |
| public_agent_dcos_instance_os | Public Agent node tested OSes image | string | `` | no |
| public_agent_disk_size | Public agent disk size (gb) | string | `` | no |
| public_agent_disk_type | Public agent node disk type. | string | `` | no |
| public_agent_image | Public agent node OS image | string | `` | no |
| public_agent_instance_type | Public agent machine type | string | `` | no |
| public_agent_public_ssh_key_path | Public Agent node Public SSH Key | string | `` | no |
| public_cidr | Master CIDR Range | string | `10.32.0.0/22` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap.admin_username | Deployed bootstrap agent SSH user |
| bootstrap.dcos_instance_os | Bootstrap node tested OSes image |
| bootstrap.disk_size | Deployed Bootstrap disk size |
| bootstrap.disk_type | Deployed Bootstrap disk type |
| bootstrap.image | Deployed bootstrap image |
| bootstrap.instance_type | Deployed bootstrap machine type |
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
| private_agents.private_ips | private_agent private ip |
| private_agents.public_ips | private_agent public ip |
| public_agents.admin_username | Deployed public agent SSH user |
| public_agents.dcos_instance_os | Public Agent node tested OSes image |
| public_agents.disk_size | Deployed public agent disk size |
| public_agents.disk_type | Deployed public agent disk type |
| public_agents.image | provided public agent OS image |
| public_agents.instance_type | Deployed public agent machine type |
| public_agents.private_ips | public_agent private ip |
| public_agents.public_ips | public_agent public ip |


## Sample Output

```bash
Apply complete! Resources: 87 added, 0 changed, 0 destroyed.

Outputs:

bootstrap.admin_username = core
bootstrap.dcos_instance_os = coreos_1235.9.0
bootstrap.disk_size = 128
bootstrap.disk_type = Standard_LRS
bootstrap.image =
bootstrap.instance_type = Standard_DS11_v2
bootstrap.private_ip = [
    10.32.4.5
]
bootstrap.public_ip = [
    bootstrap-1-mbernadin-tf09c2.westus.cloudapp.azure.com
]
dcos_version = 1.11.4
location = West US
masters.admin_username = core
masters.dcos_instance_os = coreos_1235.9.0
masters.disk_size = 128
masters.disk_type = Standard_LRS
masters.image =
masters.instance_type = Standard_DS11_v2
masters.private_ips = [
    10.32.0.8,
    10.32.0.7,
    10.32.0.6
]
masters.public_ips = [
    master-1-mbernadin-tf09c2.westus.cloudapp.azure.com,
    master-2-mbernadin-tf09c2.westus.cloudapp.azure.com,
    master-3-mbernadin-tf09c2.westus.cloudapp.azure.com
]
name_prefix = mbernadin
num_masters = 3
num_private_agents = 1
num_public_agents = 1
private_agents.admin_username = core
private_agents.dcos_instance_os = coreos_1235.9.0
private_agents.disk_size = 128
private_agents.disk_type = Standard_LRS
private_agents.image =
private_agents.instance_type = Standard_DS11_v2
private_agents.private_ips = [
    10.32.4.4
]
private_agents.public_ips = [
    pvtagt-1-mbernadin-tf09c2.westus.cloudapp.azure.com
]
public_agents.admin_username = core
public_agents.dcos_instance_os = coreos_1235.9.0
public_agents.disk_size = 128
public_agents.disk_type = Standard_LRS
public_agents.image =
public_agents.instance_type = Standard_DS11_v2
public_agents.private_ips = [
    10.32.0.5
]
public_agents.public_ips = [
    pubagt-1-mbernadin-tf09c2.westus.cloudapp.azure.com
]
```
