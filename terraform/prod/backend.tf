terraform {
  backend "gcs" {
    bucket = "backend-prod-jean-flores"
    prefix = "state"
  }
}