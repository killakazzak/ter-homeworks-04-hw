## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.133.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics-vm"></a> [analytics-vm](#module\_analytics-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_marketing-vm"></a> [marketing-vm](#module\_marketing-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.develop_a](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.develop_b](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Cloud ID; https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | CIDR blocks for subnets; https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br/>  "10.0.1.0/24",<br/>  "10.0.2.0/24"<br/>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | Default availability zone; https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_env_name_analytics"></a> [env\_name\_analytics](#input\_env\_name\_analytics) | Environment name for analytics VM | `string` | `"analytics"` | no |
| <a name="input_env_name_marketing"></a> [env\_name\_marketing](#input\_env\_name\_marketing) | Environment name for marketing VM | `string` | `"marketing"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder ID; https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | Image family for VMs | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_owner_label"></a> [owner\_label](#input\_owner\_label) | Owner label for VMs | `string` | `"i.ivanov"` | no |
| <a name="input_project_label"></a> [project\_label](#input\_project\_label) | Project label for VMs | `string` | `"accounting"` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH public keys for the instances | `list(string)` | n/a | yes |
| <a name="input_subnet_zones_analytics"></a> [subnet\_zones\_analytics](#input\_subnet\_zones\_analytics) | Subnets for analytics VM | `list(string)` | <pre>[<br/>  "ru-central1-b"<br/>]</pre> | no |
| <a name="input_subnet_zones_marketing"></a> [subnet\_zones\_marketing](#input\_subnet\_zones\_marketing) | Subnets for marketing VM | `list(string)` | <pre>[<br/>  "ru-central1-a"<br/>]</pre> | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | n/a | yes |
| <a name="input_vm_analytics_count"></a> [vm\_analytics\_count](#input\_vm\_analytics\_count) | Number of analytics instances | `number` | `2` | no |
| <a name="input_vm_analytics_name"></a> [vm\_analytics\_name](#input\_vm\_analytics\_name) | VM name prefix for analytics project | `string` | `"netology-develop-platform-analytics"` | no |
| <a name="input_vm_marketing_count"></a> [vm\_marketing\_count](#input\_vm\_marketing\_count) | Number of marketing instances | `number` | `2` | no |
| <a name="input_vm_marketing_name"></a> [vm\_marketing\_name](#input\_vm\_marketing\_name) | VM name prefix for marketing project | `string` | `"netology-develop-platform-marketing"` | no |
| <a name="input_vms_ssh_root_key"></a> [vms\_ssh\_root\_key](#input\_vms\_ssh\_root\_key) | SSH private key for root access | `string` | `"your_ssh_ed25519_key"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network and subnet name | `string` | `"develop"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_metadata"></a> [metadata](#output\_metadata) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_userdata"></a> [userdata](#output\_userdata) | n/a |
