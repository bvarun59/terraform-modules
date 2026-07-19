variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}


variable "ec2_ssh_key" {
  description = "SSH keys for Remote"
}

variable "region" {
  description = "nv Region"
}


variable "node_groups" {
  description = "Managed node groups"

  type = map(object({
    instance_types = list(string)

    ami_type = string

    desired_size = number
    min_size     = number
    max_size     = number

    disk_size = optional(number, 20)

    capacity_type = optional(string, "ON_DEMAND")

    labels = optional(map(string), {})

    taints = optional(list(object({
      key    = string
      value  = string
      effect = string
    })), [])
  }))
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the Kubernetes API server"
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to the Kubernetes API server"
  type        = bool
  default     = true
}

variable "enabled_cluster_log_types" {
  description = "Control plane logs to enable"

  type = list(string)

  default = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
}