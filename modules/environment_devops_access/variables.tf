variable "devops_namespace_name" {
  description = "The DevOps namespace name."
  type        = string

  validation {
    condition     = can(regex(module.shared.k8s_name_regex, var.devops_namespace_name))
    error_message = "Invalid DevOps namespace name. Must follow Kubernetes naming conventions."
  }
}

variable "devops_service_account_name" {
  description = "The DevOps ServiceAccount name."
  type        = string

  validation {
    condition     = can(regex(module.shared.k8s_name_regex, var.devops_service_account_name))
    error_message = "Invalid DevOps ServiceAccount name. Must follow Kubernetes naming conventions."
  }
}

variable "target_namespace_name" {
  description = "The target namespace name."
  type        = string

  validation {
    condition     = can(regex(module.shared.k8s_name_regex, var.target_namespace_name))
    error_message = "Invalid target namespace name. Must follow Kubernetes naming conventions."
  }
}

locals {
  target_devops_role_name          = "${var.target_namespace_name}-${var.devops_namespace_name}-role"
  target_devops_role_binding_name  = "${var.target_namespace_name}-${var.devops_namespace_name}-role-binding"
  target_devops_allow_ingress_name = "${var.target_namespace_name}-${var.devops_namespace_name}-allow_ingress"
  devops_target_allow_egress_name  = "${var.devops_namespace_name}-${var.target_namespace_name}-allow_egress"
}
