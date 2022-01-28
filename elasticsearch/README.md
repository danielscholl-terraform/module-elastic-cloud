# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| agent\_pool | AgentPool of the cluster | `string` | n/a | yes |
| cpu | Limit CPU Resources | `string` | `2` | no |
| create\_namespace | Create the namespace for the instance if it doesn't yet exist | `bool` | `true` | no |
| helm\_name | name of helm installation (defaults to elasticsearch-<name> | `string` | `null` | no |
| memory | Limit Memory Resources | `string` | `8` | no |
| namespace | Kubernetes namespace in which to create instance | `string` | `"default"` | no |
| node\_count | Number of nodes | `string` | `3` | no |
| storage | Storage per node (GB) | `string` | `128` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->
