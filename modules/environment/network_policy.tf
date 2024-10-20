resource "kubernetes_network_policy" "environment_network_policy" {
  metadata {
    name      = local.network_policy_name
    namespace = local.namespace_name
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress", "Egress"]

    ingress {
      from {
        pod_selector {}
      }
    }

    egress {
      to {
        pod_selector {}
      }
    }
  }
}
