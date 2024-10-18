resource "kubernetes_role_binding" "environment_devops_role_binding" {
  metadata {
    name      = "${local.environment_devops_role}-binding"
    namespace = var.environment_namespace
  }

  subject {
    kind      = "ServiceAccount"
    name      = var.devops_service_account
    namespace = var.devops_namespace
  }

  role_ref {
    kind      = "Role"
    name      = local.environment_devops_role
    api_group = "rbac.authorization.k8s.io"
  }
}