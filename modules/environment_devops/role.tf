resource "kubernetes_role" "environment_devops_role" {
  metadata {
    name      = local.environment_devops_role
    namespace = var.environment_namespace
  }

  rule {
    api_groups = [""]
    resources = ["pods", "services", "deployments"]
    verbs = ["create", "get", "list", "update", "delete"]
  }
}