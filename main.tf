/**
 * GCP Forwarding Rules - DC/OS
 * ============
 * This module creates forwarding rules for DC/OS.
 *
 * *HINT* be aware you've set the proper compute_firewall rules to enable forwarding-rules health checks to access your instances. Could be done by using `terraform-dcos/compute-firewall/gcp`
 *
 * External masters load balancer
 * ------------------------------
 * This load balancer keeps an redundant entry point to the masters
 *
 * Internal masters load balancer ( not implemented yet )
 * ------------------------------
 * this load balancer is used for internal communication to masters
 *
 * External public agents load balancer
 * ------------------------------------
 * This load balancer keeps a single entry point to your public agents no matter how many you're running.
 *
 * EXAMPLE
 * -------
 *
 *```hcl
 * module "dcos-forwarding-rules" {
 *   source  = "dcos-terraform/terraform-gcp-compute-forwarding-rule-dcos/gcp"
 *   version = "~> 0.2.0"
 *
 *   cluster_name = "production"
 *
 *   masters_self_link = ["${module.masters.instances_self_link}"]
 *   public_agents_self_link = ["${module.public_agents.instances_self_link}"]
 * }
 *```
 */

provider "google" {
}

module "dcos-forwarding-rule-masters" {
  source  = "dcos-terraform/compute-forwarding-rule-masters/gcp"
  version = "~> 0.3.0"

  cluster_name = var.cluster_name
  name_prefix  = var.name_prefix
  disable      = var.disable_masters

  masters_self_link = [var.masters_self_link]
  additional_rules  = [var.masters_additional_rules]

  labels = var.labels

  providers = {
    google = google
  }
}

module "dcos-forwarding-rule-public-agents" {
  source  = "dcos-terraform/compute-forwarding-rule-public-agents/gcp"
  version = "~> 0.3.0"

  cluster_name = var.cluster_name
  name_prefix  = var.name_prefix
  disable      = var.disable_public_agents

  public_agents_self_link = [var.public_agents_self_link]
  additional_rules        = [var.public_agents_additional_rules]

  labels = var.labels

  providers = {
    google = google
  }
}
