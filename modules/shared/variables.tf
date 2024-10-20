variable "k8s_name_regex" {
  description = "Regex for validating Kubernetes resource names. Must consist of lower-case letters, numbers, and hyphens, and must start and end with an alphanumeric character."
  type        = string
  default     = "^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?$"
}

variable "path_regex" {
  description = "Regex for validating file or directory paths. Supports both absolute and relative paths, including home directory reference with '~'."
  type        = string
  default     = "^((~|/)?([^/ ]+(/[^/ ]*)*)?|(.+/)?[^/ ]+)$"
}

variable "version_regex" {
  description = "Regex for validating semantic version strings. Allows versions with comparison operators like '>=', '<=', and versions formatted as X.Y.Z."
  type        = string
  default     = "^(>=|<=|>|<|=|~>)?\\s*\\d+\\.\\d+\\.\\d+$"
}

variable "host_regex" {
  description = "Regex for validating hostnames according to DNS standards (RFC 1035). Ensures valid domain names consisting of alphanumeric characters, hyphens, and dots."
  type        = string
  default     = "^([a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?\\.)*[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?$"
}
