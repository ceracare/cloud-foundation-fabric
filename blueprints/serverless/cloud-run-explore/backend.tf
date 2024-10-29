terraform {
  backend "gcs" {
    bucket                      = "cera-management--tf-states"
    impersonate_service_account = "sa-terraform@cera-management.iam.gserviceaccount.com"
  }
}

provider "google" {
  project                     = local.gcp_project_id
  region                      = local.main_gcp_region
  impersonate_service_account = "sa-terraform@${local.gcp_project_id}.iam.gserviceaccount.com"
  default_labels              = local.standard_tags
}

provider "google" {
  alias                       = "shared"
  project                     = "cera-${var.env}-shared"
  region                      = local.main_gcp_region
  impersonate_service_account = "sa-terraform@cera-${var.env}-shared.iam.gserviceaccount.com"
  default_labels              = local.standard_tags
}

provider "google-beta" {
  project                     = local.gcp_project_id
  region                      = local.main_gcp_region
  impersonate_service_account = "sa-terraform@${local.gcp_project_id}.iam.gserviceaccount.com"
  default_labels              = local.standard_tags
}