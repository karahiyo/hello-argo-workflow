resource "google_container_cluster" "primary" {
  name     = "argo"
  location = "us-central1"

  enable_autopilot = true
}
