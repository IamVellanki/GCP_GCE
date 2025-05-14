terraform {
  backend "gcs" {
    bucket = "gcp_terraform-state-backend"
    prefix = "gcp_gce/terraform.tfstate"
  }
}