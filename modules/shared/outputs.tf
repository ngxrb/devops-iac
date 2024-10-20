output "k8s_name_regex" {
  description = "Regex for validating Kubernetes resource names. Must consist of lower-case letters, numbers, and hyphens, and must start and end with an alphanumeric character."
  value       = var.k8s_name_regex
}

output "path_regex" {
  description = "Regex for validating file or directory paths. Supports both absolute and relative paths, including home directory reference with '~'."
  value       = var.path_regex
}

output "version_regex" {
  description = "Regex for validating semantic version strings. Allows versions with comparison operators like '>=', '<=', and versions formatted as X.Y.Z."
  value       = var.version_regex
}

output "host_regex" {
  description = "Regex for validating hostnames according to DNS standards (RFC 1035). Ensures valid domain names consisting of alphanumeric characters, hyphens, and dots."
  value       = var.host_regex
}
