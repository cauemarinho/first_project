terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.23.0"
    }
  }
}


provider "google" {
  project             = "cauemarinho-training"
}

resource "google_bigquery_dataset" "dataset" {
  project                    = "cauemarinho-training"
  dataset_id                 = "dbt_dw"
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset2" {
  project                    = "cauemarinho-training"
  dataset_id                 = "dbt_raw"
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset3" {
  project                    = "cauemarinho-training"
  dataset_id                 = "dbt_stg"
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset4" {
  project                    = "cauemarinho-training"
  dataset_id                 = "python_generate"
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset5" {
  project                    = "cauemarinho-training"
  dataset_id                 = "dbt_incremental"
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset6" {
  project                    = "cauemarinho-training"
  dataset_id                 = "dbt_snapshot"
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset7" {
  project                    = "cauemarinho-training"
  dataset_id                 = "dbt_date"
  delete_contents_on_destroy = true
}