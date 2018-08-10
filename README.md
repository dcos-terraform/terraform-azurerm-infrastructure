# DC/OS GCP Infrastucture

Creates DC/OS Infrastructure

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_name |  | string | - | yes |
| gcp_bootstrap_disk_size |  | string | - | yes |
| gcp_bootstrap_disk_type |  | string | - | yes |
| gcp_bootstrap_gce_type |  | string | - | yes |
| gcp_bootstrap_image |  | string | - | yes |
| gcp_bootstrap_ssh_user |  | string | - | yes |
| gcp_master_disk_size |  | string | - | yes |
| gcp_master_disk_type |  | string | - | yes |
| gcp_master_gce_type |  | string | - | yes |
| gcp_master_image |  | string | - | yes |
| gcp_master_ssh_user |  | string | - | yes |
| gcp_private_agent_disk_size |  | string | - | yes |
| gcp_private_agent_disk_type |  | string | - | yes |
| gcp_private_agent_gce_type |  | string | - | yes |
| gcp_private_agent_image |  | string | - | yes |
| gcp_private_agent_ssh_user |  | string | - | yes |
| gcp_public_agent_disk_size |  | string | - | yes |
| gcp_public_agent_disk_type |  | string | - | yes |
| gcp_public_agent_gce_type |  | string | - | yes |
| gcp_public_agent_image |  | string | - | yes |
| gcp_public_agent_ssh_user |  | string | - | yes |
| gcp_region |  | string | - | yes |
| gcp_ssh_key |  | string | - | yes |
| num_masters | Number of Masters | string | `1` | no |
| num_private_agents | Number of Private Agents | string | `1` | no |
| num_public_agents | Number of Public Agents | string | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_name |  |
| gcp_bootstrap_disk_size |  |
| gcp_bootstrap_disk_type |  |
| gcp_bootstrap_gce_type |  |
| gcp_bootstrap_image |  |
| gcp_master_disk_size |  |
| gcp_master_disk_type |  |
| gcp_master_gce_type |  |
| gcp_master_image |  |
| gcp_private_agent_disk_size |  |
| gcp_private_agent_disk_type |  |
| gcp_private_agent_gce_type |  |
| gcp_private_agent_image |  |
| gcp_public_agent_disk_size |  |
| gcp_public_agent_disk_type |  |
| gcp_public_agent_gce_type |  |
| gcp_public_agent_image |  |
| gcp_region |  |
| gcp_ssh_key |  |
| num_masters |  |
| num_private_agents |  |
| num_public_agents |  |
