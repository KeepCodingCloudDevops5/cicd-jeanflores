terraform {
  backend "gcs" {
    bucket = "backend-dev-jean-flores" # GCS bucket name to store terraform tfstate
    prefix = "state"                   # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}