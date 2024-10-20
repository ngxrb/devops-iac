variable "deployment_name" {
  description = "The deployment name (eg. local, saas)."
  type        = string

  validation {
    condition     = can(regex(module.shared.k8s_name_regex, var.deployment_name))
    error_message = "Invalid deployment name. Must follow Kubernetes naming conventions."
  }
}

variable "environment_name" {
  description = "The environment name (e.g. dev, prod)."
  type        = string

  validation {
    condition     = can(regex(module.shared.k8s_name_regex, var.environment_name))
    error_message = "Invalid environment name. Must follow Kubernetes naming conventions."
  }
}

locals {
  namespace_name       = "${var.deployment_name}-${var.environment_name}"
  role_name            = "${var.deployment_name}-${var.environment_name}-role"
  role_binding_name    = "${var.deployment_name}-${var.environment_name}-role-binding"
  service_account_name = "${var.deployment_name}-${var.environment_name}-service-account"
  network_policy_name  = "${var.deployment_name}-${var.environment_name}-network-policy"
}
