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

module "hub" {
  source           = "../../modules/hub"
  project_id       = var.project_id
  location         = module.gke.location
  cluster_name     = module.gke.name

  depends_on = [module.gke]
}

module "config-sync" {
  source       = "../../modules/config-sync"
  project_id   = var.project_id
  location     = module.gke.location
  cluster_name = module.gke.name

  create_membership     = false
  cluster_membership_id = module.hub.cluster_membership_id

  sync_repo   = "https://github.com/GoogleCloudPlatform/csp-config-management.git"
  sync_branch = "1.0.0"
  policy_dir  = "foo-corp"

  secret_type    = "none"
  create_ssh_key = false
}