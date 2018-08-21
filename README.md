# DC/OS GCP Infrastucture

Creates DC/OS Infrastructure

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcp_billing_account | GCP Builing Account | string | `` | no |
| gcp_bootstrap_dcos_instance_os | Bootstrap node tested OSes image | string | `` | no |
| gcp_bootstrap_disk_size | Bootstrap node disk size | string | `` | no |
| gcp_bootstrap_disk_type | Bootstrap node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard". | string | `` | no |
| gcp_bootstrap_image | Bootstrap node OS image | string | `` | no |
| gcp_bootstrap_machine_type | Bootstrap node machine type | string | `` | no |
| gcp_bootstrap_public_ssh_key | Bootstrap Node Public SSH Key | string | `` | no |
| gcp_bootstrap_ssh_user | Bootstrap node SSH User | string | `` | no |
| gcp_credentials_path_json | GCP Credentials JSON | string | - | yes |
| gcp_master_dcos_instance_os | Master node tested OSes image | string | `` | no |
| gcp_master_disk_size | Master node disk size | string | `` | no |
| gcp_master_disk_type | Master node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard". | string | `` | no |
| gcp_master_image | Master node OS image | string | `` | no |
| gcp_master_machine_type | Master node machine type | string | `` | no |
| gcp_master_public_ssh_key | Master node Public SSH Key | string | `` | no |
| gcp_master_ssh_user | Master node SSH User | string | `` | no |
| gcp_org_id | GCP Org ID | string | `` | no |
| gcp_private_agent_dcos_instance_os | Private agent node tested OSes image | string | `` | no |
| gcp_private_agent_disk_size | Private agent node disk size | string | `` | no |
| gcp_private_agent_disk_type | Private agent node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard". | string | `` | no |
| gcp_private_agent_image | Private agent node OS image | string | `` | no |
| gcp_private_agent_machine_type | Private agent node machine type | string | `` | no |
| gcp_private_agent_public_ssh_key | Private Agent node Public SSH Key | string | `` | no |
| gcp_private_agent_ssh_user | Private Agent ndoe SSH User | string | `` | no |
| gcp_project_id | Existing Project ID | string | `` | no |
| gcp_public_agent_dcos_instance_os | Public Agent node tested OSes image | string | `` | no |
| gcp_public_agent_disk_size | Public agent disk size | string | `` | no |
| gcp_public_agent_disk_type | Public agent node disk type. Can be either "pd-ssd", "local-ssd", or "pd-standard". | string | `` | no |
| gcp_public_agent_image | Public agent node OS image | string | `` | no |
| gcp_public_agent_machine_type | Public agent machine type | string | `` | no |
| gcp_public_agent_public_ssh_key | Public Agent node Public SSH Key | string | `` | no |
| gcp_public_agent_ssh_user | Public Agent node SSH User | string | `` | no |
| gcp_region | GCP Region | string | `` | no |
| gcp_ssh_key | GCP Public SSh Key | string | `` | no |
| infra_dcos_instance_os | Global Infra Tested OSes Image | string | `` | no |
| infra_disk_size | Global Infra Disk Size | string | `` | no |
| infra_disk_type | Global Infra Disk Type | string | `` | no |
| infra_machine_type | Global Infra Machine Type | string | `` | no |
| infra_public_ssh_key | Global Infra Public SSH Key | string | `` | no |
| infra_ssh_user | Global Infra SSH User | string | `` | no |
| name_prefix |  | string | - | yes |
| num_masters | Number of Masters | string | `1` | no |
| num_private_agents | Number of Private Agents | string | `1` | no |
| num_public_agents | Number of Public Agents | string | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| bootstrap_private_ips | Bootstrap private ip |
| bootstrap_public_ips | Bootstrap public ip |
| gcp_bootstrap_disk_size | Deployed Bootstrap disk size |
| gcp_bootstrap_disk_type | Deployed Bootstrap disk type |
| gcp_bootstrap_image | Deployed bootstrap image |
| gcp_bootstrap_machine_type | Deployed bootstrap machine type |
| gcp_master_disk_size | Deployed master disk size |
| gcp_master_disk_type | Deployed master disk type |
| gcp_master_image | Deployed master image |
| gcp_master_machine_type | Deployed master machine type |
| gcp_private_agent_disk_size | Deployed private agent disk size |
| gcp_private_agent_disk_type | Deployed private agent disk type |
| gcp_private_agent_image | Deployed private agent image |
| gcp_private_agent_machine_type | Deployed private agent machine type |
| gcp_public_agent_disk_size | Deployed public agent disk size |
| gcp_public_agent_disk_type | Deployed public agent disk type |
| gcp_public_agent_image | provided public agent OS image |
| gcp_public_agent_machine_type | Deployed public agent machine type |
| gcp_region | GCP Region |
| gcp_ssh_key | GCP Public SSH Key |
| masters_private_ips | masters private ip |
| masters_public_ips | masters public ip |
| name_prefix | Deployed Name Prefix |
| num_masters | Number of Masters |
| num_private_agents | Number of private agents |
| num_public_agents | Number of public agents |
| private-agent_private_ips | private-agent private ip |
| private-agent_public_ips | private-agent public ip |
| public-agent_private_ips | public-agent private ip |
| public-agent_public_ips | public-agent public ip |

## Sample Output

```bash
Outputs:

bootstrap_private_ips = [
    10.11.0.3
]
bootstrap_public_ips = [
    35.233.164.102
]
gcp_bootstrap_disk_size = 128
gcp_bootstrap_disk_type = pd-ssd
gcp_bootstrap_image =
gcp_bootstrap_machine_type = f1-micro
gcp_master_disk_size = 128
gcp_master_disk_type = pd-ssd
gcp_master_image =
gcp_master_machine_type = f1-micro
gcp_private_agent_disk_size = 128
gcp_private_agent_disk_type = pd-ssd
gcp_private_agent_image =
gcp_private_agent_machine_type = f1-micro
gcp_public_agent_disk_size = 128
gcp_public_agent_disk_type = pd-ssd
gcp_public_agent_image =
gcp_public_agent_machine_type = f1-micro
gcp_region = us-west1
gcp_ssh_key =
masters_private_ips = [
    10.10.0.2,
    10.10.0.3,
    10.10.0.4
]
masters_public_ips = [
    35.230.89.51,
    104.199.117.82,
    104.198.109.232
]
name_prefix = mbernadin
num_masters = 3
num_private_agents = 1
num_public_agents = 1
private-agent_private_ips = [
    10.11.0.2
]
private-agent_public_ips = [
    35.233.187.129
]
public-agent_private_ips = [
    10.11.0.4
]
public-agent_public_ips = [
    35.203.140.142
]
```
