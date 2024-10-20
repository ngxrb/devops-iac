resource "kubernetes_network_policy" "target_devops_allow_ingress" {
  metadata {
    name      = local.target_devops_allow_ingress_name
    namespace = var.target_namespace_name
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress"]

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.devops_namespace_name
          }
        }
      }
    }
  }
}

resource "kubernetes_network_policy" "devops_target_allow_egress" {
  metadata {
    name      = local.devops_target_allow_egress_name
    namespace = var.devops_namespace_name
  }

  spec {
    pod_selector {}

    policy_types = ["Egress"]

    egress {
      to {
        namespace_selector {
          match_labels = {
            name = var.target_namespace_name
          }
        }
      }
    }
  }
}
