terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-rj"
    prefix = "terraform/state"
  }
}

