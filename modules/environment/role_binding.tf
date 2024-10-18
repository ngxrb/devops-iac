resource "kubernetes_role_binding" "environment_role_binding" {
  metadata {
    name      = "${local.role}-binding"
    namespace = local.namespace
  }

  subject {
    kind      = "ServiceAccount"
    name      = local.service_account
    namespace = local.namespace
  }

  role_ref {
    kind      = "Role"
    name      = local.role
    api_group = "rbac.authorization.k8s.io"
  }
}