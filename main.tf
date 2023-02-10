  data "google_container_engine_versions" "default" {
    location = "asia-southeast2-a"
  }
  data "google_client_config" "current" {
  }

  resource "google_container_cluster" "default" {
    name               = "challenge-cluster"
    location           = "asia-southeast2-a"
    initial_node_count = 3
    enable_autopilot = true

    node_config {
      machine_type = "e2-medium"
      disk_size_gb = 32
    }

    provisioner "local-exec" {
      when    = destroy
      command = "sleep 90"
    }
  }

resource "google_container_node_pool" "default" {
  name       = "default-node-pool"
  cluster    = google_container_cluster.default.name
  max_pods_per_node = 32
}
