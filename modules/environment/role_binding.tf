resource "kubernetes_role_binding" "environment_role_binding" {
  metadata {
    name      = local.role_binding_name
    namespace = local.namespace_name
  }

  subject {
    kind      = "ServiceAccount"
    name      = local.service_account_name
    namespace = local.namespace_name
  }

  role_ref {
    kind      = "Role"
    name      = local.role_name
    api_group = "rbac.authorization.k8s.io"
  }
}
