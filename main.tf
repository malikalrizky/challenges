  data "google_container_engine_versions" "default" {
    location = "asia-southeast2-a"
  }
  data "google_client_config" "current" {
  }

  resource "google_container_cluster" "default" {
    name               = "challenge-cluster"
    location           = "asia-southeast2"
    initial_node_count = 1
    ip_allocation_policy {
  }
    enable_autopilot = true

  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "github@carbon-shadow-377208.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

}
