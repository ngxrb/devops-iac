variable "k8s_name_regex" {
  description = "Regex for validating Kubernetes resource names"
  type        = string
  default     = "^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?$"
}

variable "path_regex" {
  description = "Regex for validating file or directory paths"
  type        = string
  default     = "^((~|/)?([^/ ]+(/[^/ ]*)*)?|(.+/)?[^/ ]+)$"
}

variable "version_regex" {
  description = "Regex for validating semantic version strings"
  type        = string
  default     = "^(>=|<=|>|<|=|~>)?\\s*\\d+\\.\\d+\\.\\d+$"
}
