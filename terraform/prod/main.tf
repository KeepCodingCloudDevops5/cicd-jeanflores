

# Create a GCS Bucket
resource "google_storage_bucket" "project_dev_gcs_bucket" {
  name     = var.bucket_name
  location = var.region

  labels = {
    "created_by" = "terraform"
  }
}