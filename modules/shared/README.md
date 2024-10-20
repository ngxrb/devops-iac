# IaC Commons: Shared

This module provides reusable regular expressions (regex) for validating various types of input, such as hostnames,
Kubernetes resource names, file paths, and semantic versioning. These regex patterns are compliant with industry
standards and ensure proper validation across multiple use cases.

## Overview

This module defines common regex patterns used for input validation in infrastructure-as-code (IaC) environments. It
helps enforce naming conventions and standards for hostnames, Kubernetes resources, file paths, and versions.

## Requirements

There are no specific system requirements for using this module.

## Providers

This module does not require any providers.

## Modules

This module does not utilize any sub-modules.

## Resources

This module does not create any resources.

## Inputs

| Name             | Description                                                                                                                                                         | Type     | Default                                                                                  | Required |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|------------------------------------------------------------------------------------------|:--------:|
| `host_regex`     | A regex for validating hostnames according to DNS standards (RFC 1035). Ensures valid domain names using alphanumeric characters, hyphens, and dots.                | `string` | `"^([a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?\\.)*[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?$"` |    no    |
| `k8s_name_regex` | A regex for validating Kubernetes resource names. Names must consist of lowercase letters, numbers, and hyphens, and must start/end with an alphanumeric character. | `string` | `"^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?$"`                                                 |    no    |
| `path_regex`     | A regex for validating file or directory paths. Supports both absolute and relative paths, including home directory references like '~'.                            | `string` | `"^((~\|/)?([^/ ]+(/[^/ ]*)*)?\|(.+/)?[^/ ]+)$"`                                         |    no    |
| `version_regex`  | A regex for validating semantic version strings. Supports comparison operators like '>=', '<=', and semantic versioning format (X.Y.Z).                             | `string` | `"^(>=\|<=\|>\|<\|=\|~>)?\\s*\\d+\\.\\d+\\.\\d+$"`                                       |    no    |

## Outputs

| Name             | Description                                                                                                                                                     |
|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `host_regex`     | Regex for validating hostnames according to DNS standards (RFC 1035). Ensures valid domain names using alphanumeric characters, hyphens, and dots.              |
| `k8s_name_regex` | Regex for validating Kubernetes resource names. Must consist of lowercase letters, numbers, and hyphens, and must start and end with an alphanumeric character. |
| `path_regex`     | Regex for validating file or directory paths. Supports both absolute and relative paths, including references to the home directory with '~'.                   |
| `version_regex`  | Regex for validating semantic version strings. Allows versions with comparison operators like '>=', '<=', and versions formatted as X.Y.Z.                      |

## Usage

To use this module, simply reference the regex patterns in your Terraform configuration. For example, to validate a
Kubernetes resource name:

```hcl
module "shared" {
  source = "git::https://github.com/ngxrb/iac-commons.git//modules/shared"
}

variable "namespace_name" {
  description = "The namespace name."
  type        = string

  validation {
    condition = can(regex(module.shared.k8s_name_regex, var.namespace_name))
    error_message = "Invalid namespace name. Must follow Kubernetes naming conventions."
  }
}
```

## Best Practices

- **Use Hostname Regex for DNS Validation:** Ensure that all domain names follow RFC 1035 standards to prevent invalid
  hostnames.
- **Kubernetes Naming Conventions:** Ensure all Kubernetes resources follow strict lowercase alphanumeric and
  hyphen-based naming conventions.
- **Validate File Paths Carefully:** Support for both absolute and relative paths ensures that your file and directory
  paths are validated consistently.
- **Semantic Versioning:** Enforce the correct format for versions, especially in CI/CD pipelines and software
  versioning practices.
