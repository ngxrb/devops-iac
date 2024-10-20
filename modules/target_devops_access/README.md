# IaC Commons: Target DevOps Access

This module provisions the necessary roles and minimal permissions required to allow a DevOps namespace to access a
target namespace, adhering to strict security measures.

## Overview

This module creates the essential Kubernetes resources, such as roles, role bindings, and network policies, to securely
grant access from a DevOps namespace to a target namespace. It follows best practices to ensure that permissions are
kept minimal while allowing the required level of access.

## Requirements

There are no specific system requirements for running this module.

## Providers

| Name                                                                              | Version |
|-----------------------------------------------------------------------------------|---------|
| [kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest) | n/a     |

## Modules

| Name     | Source    | Version |
|----------|-----------|---------|
| `shared` | ../shared | n/a     |

## Resources

The following Kubernetes resources are created by this module:

| Name                                                                                                                                          | Type     |
|-----------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [Network Policy: Allow Egress from DevOps](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | Resource |
| [Network Policy: Allow Ingress to Target](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy)  | Resource |
| [Role: DevOps Access to Target](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role)                      | Resource |
| [Role Binding: DevOps Access to Target](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding)      | Resource |

## Inputs

| Name                          | Description                            | Type     | Default | Required |
|-------------------------------|----------------------------------------|----------|---------|:--------:|
| `devops_namespace_name`       | The name of the DevOps namespace.      | `string` | n/a     |   yes    |
| `devops_service_account_name` | The name of the DevOps ServiceAccount. | `string` | n/a     |   yes    |
| `target_namespace_name`       | The name of the target namespace.      | `string` | n/a     |   yes    |

## Outputs

| Name                               | Description                                                                     |
|------------------------------------|---------------------------------------------------------------------------------|
| `devops_target_allow_egress_name`  | The network policy that allows egress from the DevOps namespace to the target.  |
| `target_devops_allow_ingress_name` | The network policy that allows ingress to the target namespace from the DevOps. |
| `target_devops_role_binding_name`  | The role binding that allows DevOps access to the target namespace.             |
| `target_devops_role_name`          | The role that grants DevOps access to the target namespace.                     |

## Usage

To use this module, add it to your Terraform configuration and provide the required inputs. For example:

```hcl
module "target_devops_access" {
  source                      = "git::https://github.com/ngxrb/iac-commons.git//modules/target_devops_access"
  devops_namespace_name       = "local-devops"
  devops_service_account_name = "local-devops-sa"
  target_namespace_name       = "local-dev"
}
```

After configuring the module, you can apply the changes with:

```bash
terraform init
terraform apply
```

## Best Practices

- **Restrict Egress and Ingress:** Use network policies to limit communication between namespaces.
- **Principle of Least Privilege:** Only grant the necessary roles and permissions for the required tasks.
- **Audit and Review:** Regularly audit the roles and permissions to ensure that access is secure and minimal.
