resource "kubernetes_network_policy" "environment_deny_all_external" {
  metadata {
    name      = "deny-all-external"
    namespace = local.namespace
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
