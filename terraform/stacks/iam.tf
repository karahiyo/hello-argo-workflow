resource "google_service_account" "argo" {
  account_id   = "argo-workflow-user"
  display_name = "Service Account for argo workflow cluster"
}
