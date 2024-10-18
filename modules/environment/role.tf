resource "kubernetes_role" "environment_role" {
  metadata {
    name      = local.role
    namespace = local.namespace
  }

  rule {
    api_groups = [""]
    resources = ["pods", "services", "endpoints"]
    verbs = ["get", "list", "watch"]
  }

  rule {
    api_groups = [""]
    resources = ["configmaps"]
    verbs = ["get"]
  }
}
