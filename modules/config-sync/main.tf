/**
 * Copyright 2018 Google LLC
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

module "registration" {
  source = "../hub"

  cluster_name                = var.cluster_name
  project_id                  = var.project_id
  location                    = var.location
  enable_gke_hub_registration = var.create_membership
  gke_hub_membership_name     = var.cluster_membership_id
}

module "acm_operator" {
  source = "../hub-acm-feature"

  cluster_name          = var.cluster_name
  project_id            = var.project_id
  location              = var.location
  cluster_membership_id = module.registration.cluster_membership_id

  source_format = var.source_format
  sync_repo     = var.sync_repo
  sync_branch   = var.sync_branch
  sync_revision = var.sync_revision

  create_ssh_key = var.create_ssh_key
  secret_type    = var.secret_type
  ssh_auth_key   = var.ssh_auth_key

  enable_policy_controller = false

  hierarchy_controller = var.hierarchy_controller

  # Necessary for generating credentials secrets
  service_account_key_file = var.service_account_key_file
  use_existing_context     = var.use_existing_context

  operator_credential_namespace = "config-management-system"
  operator_credential_name      = "git-creds"
}
