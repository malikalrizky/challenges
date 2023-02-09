resource "kubernetes_deployment" "challenge" {
  metadata {
    name = "challenge"
    labels = {
      App = "challenge"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "challenge"
      }
    }
    template {
      metadata {
        labels = {
          App = "challenge"
        }
      }
      spec {
        container {
          name = "challege"
          image = "challege-:latest"

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
