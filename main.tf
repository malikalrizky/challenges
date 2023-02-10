  data "google_container_engine_versions" "default" {
    location = "asia-southeast2-a"
  }
  data "google_client_config" "current" {
  }

  resource "google_container_node_pool" "default" {
  name       = "default-node-pool"
  cluster    = google_container_cluster.default.name
  max_pods_per_node = 32

      node_config {
      machine_type = "e2-medium"
      disk_size_gb = 32
      service_account = "github@carbon-shadow-377208.iam.gserviceaccount.com"
      oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    }

      provisioner "local-exec" {
      when    = destroy
      command = "sleep 90"
    }
}
  resource "google_container_cluster" "default" {
    name               = "challenge-cluster"
    location           = "asia-southeast2-a"
    initial_node_count = 1
    enable_autopilot = true
    node_locations = [
    "asia-southeast2-a",
  ]

  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "github@carbon-shadow-377208.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }


}
