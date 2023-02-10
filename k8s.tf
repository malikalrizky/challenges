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

  resource "google_compute_address" "default" {
    name   = "ipforservice"
    region = var.region
  }

    resource "kubernetes_service" "appservice" {
    metadata {
      name = "nodeapp-lb-service"
    }
    spec {
      type             = "LoadBalancer"
      load_balancer_ip = google_compute_address.default.address
      port {
        port        = 3000
        target_port = 3000
      }
      selector = {
        App  = "nodeapp"
      }
    }
  }