variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "public_agents_self_link" {
  description = "List of public agent instances self links"
  type        = list(string)
  default     = []
}

variable "public_agents_additional_rules" {
  description = "Additional list of rules for public agents. These Rules are an additon to the default rules."
  default     = []
}

variable "masters_self_link" {
  description = "List of master instances self links"
  type        = list(string)
  default     = []
}

variable "masters_additional_rules" {
  description = "Additional list of rules for masters. These Rules are an additon to the default rules."
  default     = []
}

variable "labels" {
  description = "Add custom labels to all resources"
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "Name Prefix"
  default     = ""
}

variable "disable_masters" {
  description = "[MASTERS] Do not create load balancer and its resources"
  default     = false
}

variable "disable_public_agents" {
  description = "[PUBLIC AGENTS] Do not create load balancer and its resources"
  default     = false
}

