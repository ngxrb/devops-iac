resource "kubernetes_role_binding" "target_devops_role_binding" {
  metadata {
    name      = local.target_devops_role_binding_name
    namespace = var.target_namespace_name
  }

  subject {
    kind      = "ServiceAccount"
    name      = var.devops_service_account_name
    namespace = var.devops_namespace_name
  }

  role_ref {
    kind      = "Role"
    name      = local.target_devops_role_name
    api_group = "rbac.authorization.k8s.io"
  }
}