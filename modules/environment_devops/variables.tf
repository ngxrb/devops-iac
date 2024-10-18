variable "devops_namespace" {
  description = "Namespace for DevOps services and tools."
  type        = string

  validation {
    condition = can(regex(module.shared.k8s_name_regex, var.devops_namespace))
    error_message = "Invalid DevOps namespace. Must follow Kubernetes naming conventions."
  }
}

variable "devops_service_account" {
  description = "ServiceAccount for DevOps namespace."
  type        = string

  validation {
    condition = can(regex(module.shared.k8s_name_regex, var.devops_service_account))
    error_message = "Invalid ServiceAccount. Must follow Kubernetes naming conventions."
  }
}

variable "environment_namespace" {
  description = "Environment namespace to grant access."
  type        = string

  validation {
    condition = can(regex(module.shared.k8s_name_regex, var.environment_namespace))
    error_message = "Invalid environment namespace. Must follow Kubernetes naming conventions."
  }
}

locals {
  environment_devops_role = "${var.environment_namespace}-${var.devops_namespace}-role"
}
