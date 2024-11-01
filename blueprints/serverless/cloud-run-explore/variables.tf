/**
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "custom_domain" {
  description = "Custom domain for the Load Balancer."
  type        = string
  default     = null
}

variable "iap" {
  description = "Identity-Aware Proxy for Cloud Run in the LB."
  type = object({
    enabled            = optional(bool, false)
    app_title          = optional(string, "Cloud Run Explore Application")
    oauth2_client_name = optional(string, "Test Client")
    email              = optional(string)
  })
  default = {}
}

variable "image" {
  description = "Container image to deploy."
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "ingress_settings" {
  description = "Ingress traffic sources allowed to call the service."
  type        = string
  default     = "all"
}

variable "project_create" {
  description = "Parameters for the creation of a new project."
  type = object({
    billing_account_id = string
    parent             = string
  })
  default = null
}

# variable "project_id" {
#   description = "Project ID."
#   type        = string
# }

variable "region" {
  description = "Cloud region where resource will be deployed."
  type        = string
  default     = "europe-west2"
}

variable "run_svc_name" {
  description = "Cloud Run service name."
  type        = string
  default     = "hello"
}

variable "security_policy" {
  description = "Security policy (Cloud Armor) to enforce in the LB."
  type = object({
    enabled      = optional(bool, false)
    ip_blacklist = optional(list(string), ["*"])
    path_blocked = optional(string, "/login.html")
  })
  default = {}
}

variable "env" {
  type        = string
  description = "Short Environment name: dev, stage, prod. Passed through pipeline's environment name"
  validation {
    condition     = contains(["dev", "qa", "prod"], var.env)
    error_message = "Environment can be only dev, qa or prod"
  }
}

variable "repo_name" {
  type        = string
  description = "Repository name just. Supplied via a pipeline"
}

variable "app" {
  type        = string
  description = "Your project name. It's being used in Resources Name generation"
}

variable "project_suffix" {
  type        = string
  description = "Your project name. It's being used in GCP Project ID generation"
}

variable "gen2_execution_environment" {
  description = "Use second generation execution environment."
  type        = bool
  default     = false
}

variable "use_classic_version" {
  description = "Use classic Global Load Balancer."
  type        = bool
  default     = true
}