output "target_devops_role_name" {
  description = "The target role name to enable DevOps access."
  value       = local.target_devops_role_name
}

output "target_devops_role_binding_name" {
  description = "The target role binding to enable DevOps access."
  value       = local.target_devops_role_binding_name
}

output "target_devops_allow_ingress_name" {
  description = "The network policy to allow ingress to the target namespace from DevOps."
  value       = local.target_devops_allow_ingress_name
}

output "devops_target_allow_egress_name" {
  description = "The network policy to allow egress from DevOps to the target namespace."
  value       = local.devops_target_allow_egress_name
}
