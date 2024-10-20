resource "kubernetes_service_account" "environment_service_account" {
  metadata {
    name      = local.service_account_name
    namespace = local.namespace_name
  }
}
