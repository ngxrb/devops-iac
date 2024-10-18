resource "kubernetes_network_policy" "environment_allow_devops_ingress" {
  metadata {
    name      = "allow-${var.devops_namespace}-ingress"
    namespace = var.environment_namespace
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress"]

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.devops_namespace
          }
        }
      }
    }
  }
}

resource "kubernetes_network_policy" "devops_allow_egress_to_environment" {
  metadata {
    name      = "allow-egress-to-${var.environment_namespace}"
    namespace = var.devops_namespace
  }

  spec {
    pod_selector {}

    policy_types = ["Egress"]

    egress {
      to {
        namespace_selector {
          match_labels = {
            name = var.environment_namespace
          }
        }
      }
    }
  }
}
