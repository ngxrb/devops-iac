# IaC Commons: Environment

This module provisions a Kubernetes environment within a specific namespace, applying minimum security permissions in
line with SecDevOps best practices.

## Overview

This module sets up a namespace in Kubernetes with the necessary resources such as roles, role bindings, network
policies, and service accounts. It aims to provide a secure, isolated environment following industry-standard security
practices for DevOps and SecOps teams.

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

This module creates the following Kubernetes resources:

| Name                                                                                                                  | Type     |
|-----------------------------------------------------------------------------------------------------------------------|----------|
| [Namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace)             | Resource |
| [Network Policy](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy)   | Resource |
| [Role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role)                       | Resource |
| [Role Binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding)       | Resource |
| [Service Account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | Resource |

## Inputs

| Name               | Description                                     | Type     | Default | Required |
|--------------------|-------------------------------------------------|----------|---------|:--------:|
| `deployment_name`  | The name of the deployment (e.g., local, saas). | `string` | n/a     |   yes    |
| `environment_name` | The name of the environment (e.g., dev, prod).  | `string` | n/a     |   yes    |

## Outputs

| Name                   | Description                                  |
|------------------------|----------------------------------------------|
| `namespace_name`       | The name of the environment namespace.       |
| `network_policy_name`  | The name of the environment network policy.  |
| `role_binding_name`    | The name of the environment role binding.    |
| `role_name`            | The name of the environment role.            |
| `service_account_name` | The name of the environment service account. |

## Usage

To use this module, simply include it in your Terraform configuration and specify the required inputs. For example:

```hcl
module "deploy_dev_environment" {
  source           = "git::https://github.com/ngxrb/iac-commons.git//modules/environment"
  deployment_name  = "local"
  environment_name = "dev"
}
```

Run the following commands to apply the configuration:

```bash
terraform init
terraform apply
```

## Best Practices

- Ensure that each environment (e.g., dev, prod) has its own namespace for isolation.
- Use network policies to restrict traffic between services as needed.
- Regularly review role permissions to adhere to the principle of least privilege.
