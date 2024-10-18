output "k8s_name_regex" {
  description = "Regex for validating Kubernetes resource names"
  value       = var.k8s_name_regex
}

output "path_regex" {
  description = "Regex for validating file or directory paths"
  value       = var.path_regex
}

output "version_regex" {
  description = "Regex for validating semantic version strings"
  value       = var.version_regex
}