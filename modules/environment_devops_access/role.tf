resource "kubernetes_role" "target_devops_role" {
  metadata {
    name      = local.target_devops_role_name
    namespace = var.target_namespace_name
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "deployments"]
    verbs      = ["create", "get", "list", "update", "delete"]
  }
}