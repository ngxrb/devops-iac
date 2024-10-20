# Infrastructure as Code (IaC) Commons

The **IaC Commons** repository provides reusable modules for managing infrastructure as code across various
environments. Each module addresses different aspects of Kubernetes and infrastructure management, adhering to best
practices for security, DevOps, and standardization. These modules ensure proper setup of environments, access control,
and validation, following SecDevOps principles and enforcing naming conventions and versioning standards.

## Table of Contents

1. [IaC Commons: Environment](#iac-commons-environment)
2. [IaC Commons: Target DevOps Access](#iac-commons-target-devops-access)
3. [IaC Commons: Shared](#iac-commons-shared)

## IaC Commons: Environment

This module creates a secure Kubernetes environment by provisioning a namespace with minimal permissions. It includes
the necessary resources such as roles, role bindings, network policies, and service accounts, following SecDevOps best
practices to ensure isolation and security.

### Features:

- Automatically provisions a Kubernetes namespace.
- Implements network policies to restrict traffic between services.
- Configures roles and role bindings for access control.
- Creates service accounts for each environment.

### Key Inputs:

- `deployment_name`: The name of the deployment (e.g., local, saas).
- `environment_name`: The name of the environment (e.g., dev, prod).

### Key Outputs:

- Names of the provisioned namespace, network policies, roles, role bindings, and service accounts.

[Read more about this module here](./modules/environment/README.md)

## IaC Commons: Target DevOps Access

This module sets up the necessary roles and permissions to allow a DevOps namespace to access a target namespace
securely. It creates network policies, roles, and role bindings to facilitate safe and minimal access between
namespaces.

### Features:

- Provides network policies for controlling ingress and egress between namespaces.
- Configures roles and role bindings to grant DevOps access to the target namespace.
- Ensures all actions adhere to the principle of least privilege.

### Key Inputs:

- `devops_namespace_name`: The name of the DevOps namespace.
- `devops_service_account_name`: The name of the ServiceAccount in the DevOps namespace.
- `target_namespace_name`: The name of the target namespace.

### Key Outputs:

- Names of the network policies for egress and ingress.
- Role and role binding names for DevOps access to the target namespace.

[Read more about this module here](./modules/target_devops_access/README.md)

## IaC Commons: Shared

This module provides common regular expressions (regex) that are useful for validating hostnames, Kubernetes resource
names, file paths, and semantic versions. These regex patterns enforce industry standards and help maintain consistency
across infrastructure resources.

### Features:

- Validates hostnames according to DNS standards (RFC 1035).
- Validates Kubernetes resource names, ensuring they comply with naming conventions.
- Validates file and directory paths for both absolute and relative references.
- Validates semantic versioning formats, including support for comparison operators.

### Key Inputs:

- `host_regex`: Regex for validating hostnames.
- `k8s_name_regex`: Regex for validating Kubernetes resource names.
- `path_regex`: Regex for validating file paths.
- `version_regex`: Regex for validating semantic version strings.

### Key Outputs:

- Returns the regex patterns for hostname, Kubernetes names, file paths, and version validation.

[Read more about this module here](./modules/shared/README.md)

## Best Practices

When using these modules, follow these general best practices:

- **Namespace Isolation:** Always ensure each environment (e.g., dev, prod) has its own isolated namespace to avoid
  conflicts.
- **Principle of Least Privilege:** Grant only the necessary permissions to each role or service account, especially
  when setting up DevOps access.
- **Network Policies:** Implement network policies to restrict communication between namespaces and limit exposure to
  potential security risks.
- **Regex Validation:** Use predefined regex patterns to enforce standardization across your infrastructure resources,
  preventing errors related to invalid names or versions.

## Getting Started

To use the modules from this repository in your Terraform configuration, include them as submodules and provide the
necessary inputs. For example:

```hcl
module "environment" {
  source           = "git::https://github.com/ngxrb/iac-commons.git//modules/environment"
  deployment_name  = "local"
  environment_name = "dev"
}

module "target_devops_access" {
  source                      = "git::https://github.com/ngxrb/iac-commons.git//modules/target-devops-access"
  devops_namespace_name       = "local-devops"
  devops_service_account_name = "local-devops-sa"
  target_namespace_name       = "local-dev"
}

module "shared" {
  source = "git::https://github.com/ngxrb/iac-commons.git//modules//shared"
}
```

Then, run the following commands to initialize and apply the configurations:

```bash
terraform init
terraform apply
```
