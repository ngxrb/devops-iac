output "namespace_name" {
  description = "The environment namespace name."
  value       = local.namespace_name
}

output "role_name" {
  description = "The environment role name."
  value       = local.role_name
}

output "role_binding_name" {
  description = "The environment role binding name."
  value       = local.role_binding_name
}

output "service_account_name" {
  description = "The environment ServiceAccount name."
  value       = local.service_account_name
}

output "network_policy_name" {
  description = "The environment network policy name."
  value       = local.network_policy_name
}
