resource "kubernetes_deployment" "challege" {
  metadata {
    name = "challege"
    labels = {
      App = "challege"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "challege"
      }
    }
    template {
      metadata {
        labels = {
          App = "challege"
        }
      }
      spec {
        container {
          name = "challege"
          image = "challege:latest"

          port {
              container_port = 3000
          }

          resources {
            limits = {
              cpu = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
