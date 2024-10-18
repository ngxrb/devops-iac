variable "deployment_name" {
  description = "Deployment name (eg. local, saas)."
  type        = string

  validation {
    condition = can(regex(module.shared.k8s_name_regex, var.deployment_name))
    error_message = "Invalid deployment name. Must follow Kubernetes naming conventions."
  }
}

variable "environment_name" {
  description = "Environment name (e.g. dev, prod)."
  type        = string

  validation {
    condition = can(regex(module.shared.k8s_name_regex, var.environment_name))
    error_message = "Invalid environment name. Must follow Kubernetes naming conventions."
  }
}

locals {
  namespace       = "${var.deployment_name}-${var.environment_name}"
  role            = "${var.deployment_name}-${var.environment_name}-role"
  service_account = "${var.deployment_name}-${var.environment_name}-sa"
}