<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_zstack"></a> [zstack](#requirement\_zstack) | 1.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_zstack"></a> [zstack](#provider\_zstack) | 1.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [zstack_instance.instance](https://registry.terraform.io/providers/ZStack-Robot/zstack/1.0.5/docs/resources/instance) | resource |
| [zstack_instance_offers.offers](https://registry.terraform.io/providers/ZStack-Robot/zstack/1.0.5/docs/data-sources/instance_offers) | data source |
| [zstack_l3networks.l3networks](https://registry.terraform.io/providers/ZStack-Robot/zstack/1.0.5/docs/data-sources/l3networks) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_uuid"></a> [cluster\_uuid](#input\_cluster\_uuid) | The UUID of the cluster where the instance will be created | `string` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br/><br/>Examples:<pre>context:<br/>  project:<br/>    name: string<br/>    id: string<br/>  environment:<br/>    name: string<br/>    id: string<br/>  resource:<br/>    name: string<br/>    id: string</pre> | `map(any)` | `{}` | no |
| <a name="input_data_volumes"></a> [data\_volumes](#input\_data\_volumes) | List of data volumes to attach to the instance | <pre>list(object({<br/>    disk_offering_uuid = string<br/>    name              = optional(string)<br/>    description       = optional(string)<br/>    primary_storage_uuid = optional(string)<br/>    system_tags       = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_default_password"></a> [default\_password](#input\_default\_password) | The default password for the instance | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the instance | `string` | `""` | no |
| <a name="input_host_uuid"></a> [host\_uuid](#input\_host\_uuid) | The UUID of the host where the instance will be created | `string` | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of the instance | `string` | `""` | no |
| <a name="input_image_uuid"></a> [image\_uuid](#input\_image\_uuid) | The UUID of the image to use | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances to create | `number` | `1` | no |
| <a name="input_instance_offering_name"></a> [instance\_offering\_name](#input\_instance\_offering\_name) | The name of the instance offering to query (alternative to instance\_offering\_uuid) | `string` | `null` | no |
| <a name="input_instance_offering_uuid"></a> [instance\_offering\_uuid](#input\_instance\_offering\_uuid) | UUID of the instance offering | `string` | `""` | no |
| <a name="input_l3_network_name"></a> [l3\_network\_name](#input\_l3\_network\_name) | The name of the L3 network to query (alternative to l3\_network\_uuids) | `string` | `null` | no |
| <a name="input_l3_network_uuids"></a> [l3\_network\_uuids](#input\_l3\_network\_uuids) | List of L3 network UUIDs to attach to the instance | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the instance | `string` | n/a | yes |
| <a name="input_never_stop"></a> [never\_stop](#input\_never\_stop) | vm ha | `bool` | `true` | no |
| <a name="input_primary_storage_uuid_for_root_volume"></a> [primary\_storage\_uuid\_for\_root\_volume](#input\_primary\_storage\_uuid\_for\_root\_volume) | The UUID of the primary storage for the root volume | `string` | `null` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | The type of the root volume | `string` | `"DefaultPrimaryStorage"` | no |
| <a name="input_ssh_key_uuid"></a> [ssh\_key\_uuid](#input\_ssh\_key\_uuid) | The UUID of the SSH key to use | `string` | `null` | no |
| <a name="input_system_tags"></a> [system\_tags](#input\_system\_tags) | The system tags of the instance | `list(string)` | `[]` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout for operations | `number` | `300` | no |
| <a name="input_user_tags"></a> [user\_tags](#input\_user\_tags) | The user tags of the instance | `list(string)` | `[]` | no |
| <a name="input_zone_uuid"></a> [zone\_uuid](#input\_zone\_uuid) | The UUID of the zone where the instance will be created | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of the created instances |
| <a name="output_instance_ips"></a> [instance\_ips](#output\_instance\_ips) | The IP addresses of the created instances |
| <a name="output_instance_names"></a> [instance\_names](#output\_instance\_names) | Names of the created instances |
| <a name="output_instance_nics"></a> [instance\_nics](#output\_instance\_nics) | The network interfaces of the created instances |
| <a name="output_instances"></a> [instances](#output\_instances) | The created instances |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->