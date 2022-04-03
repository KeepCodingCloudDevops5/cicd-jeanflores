terraform {
  backend "gcs" {
    bucket = "backend-dev-jean-flores"
    prefix = "state"
  }
}