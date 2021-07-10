terraform {
  backend "gcs" {
    bucket = "tf-state-hello-argo-workflow"
  }
}
