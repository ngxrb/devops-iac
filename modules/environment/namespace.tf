resource "kubernetes_namespace" "environment_namespace" {
  metadata {
    name = local.namespace
  }
}
