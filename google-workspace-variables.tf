variable "google_workspace_gcp_project_id" {
  type        = string
  description = "string ID of GCP project that will host oauth clients for Google Workspace API connectors; must exist"
}

variable "google_workspace_terraform_sa_account_email" {
  type        = string
  description = "Email of GCP service account that will be used to provision GCP resources. Leave 'null' to use application default for you environment."
  default     = null

  validation {
    condition     = var.google_workspace_terraform_sa_account_email == null || can(regex(".*@.*\\.iam\\.gserviceaccount\\.com$", var.google_workspace_terraform_sa_account_email))
    error_message = "The gcp_terraform_sa_account_email value should be a valid GCP service account email address."
  }
}

variable "google_workspace_example_user" {
  type        = string
  description = "user to impersonate for Google Workspace API calls (null for none)"
  default     = null
}

variable "google_workspace_example_admin" {
  type        = string
  description = "user to impersonate for Google Workspace API calls (null for value of `google_workspace_example_user`)"
  default     = null # will failover to user
}

variable "google_workspace_provision_keys" {
  type        = bool
  description = "whether to provision key for each Google Workspace connector's GCP Service Account (OAuth Client). If false, you must create the key manually and provide it."
  default     = true
}

locals {
  # tflint-ignore: terraform_unused_declarations
  some_google_connector_enabled                    = (length(setintersection(var.enabled_connectors, ["gcal", "gdirectory", "gdrive", "gmail", "google-meet", "google-chat", "gemini-for-workspace"])) > 0)
  validate_google_workspace_gcp_project_id         = (var.google_workspace_gcp_project_id == null || var.google_workspace_gcp_project_id == "") && local.some_google_connector_enabled
  validate_google_workspace_gcp_project_id_message = "The google_workspace_gcp_project_id var should be populated if a Google Workspace connector is enabled."
  validate_google_workspace_gcp_project_id_check = regex(
    "^${local.validate_google_workspace_gcp_project_id_message}$",
    (!local.validate_google_workspace_gcp_project_id
      ? local.validate_google_workspace_gcp_project_id_message
  : ""))
}
