locals {
  main_gcp_region = "europe-west2"

  gcp_project_id        = "cof-${var.env}-${var.project_suffix}"
  gcp_shared_project_id = "cof-${var.env}-shared"

  standard_tags = {
    managedby = "terraform"
    repo      = var.repo_name
    env       = var.env
  }
}