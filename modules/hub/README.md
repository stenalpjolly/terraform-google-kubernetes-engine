# Terraform Kubernetes Engine Hub Submodule

This module [registers a GKE cluster](https://cloud.google.com/anthos/multicluster-management/connect/registering-a-cluster) in an Anthos [Environ](https://cloud.google.com/anthos/multicluster-management/environs).

Specifically, this module automates the following steps for [registering a cluster](https://cloud.google.com/anthos/multicluster-management/connect/registering-a-cluster#register_cluster)

## Usage

There is [GKE full example](../../examples/simple_zonal_with_asm) and a [Generic K8s example](../../examples/simple_zonal_with_hub_kubeconfig) provided. Simple usage is as follows:

```tf
module "hub" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/hub"

  project_id       = "my-project-id"
  cluster_name     = "my-cluster-name"
}
```

To deploy this config:
1. Run `terraform apply`

 <!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | The GKE cluster name | `string` | n/a | yes |
| enable\_gke\_hub\_registration | Enables GKE Hub Registration when set to true | `bool` | `true` | no |
| gke\_hub\_membership\_name | Membership name that uniquely represents the cluster being registered on the Hub. Defaults to `$project_id-$location-$cluster_name`. | `string` | `""` | no |
| hub\_project\_id | The project in which the GKE Hub belongs. | `string` | `""` | no |
| location | The location (zone or region) this cluster has been created in. | `string` | n/a | yes |
| module\_depends\_on | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| project\_id | The project in which the GKE cluster belongs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_membership\_id | The ID of the hub membership |
| wait | An output to use when you want to depend on registration finishing |

 <!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
