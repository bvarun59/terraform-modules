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

variable "instance_types" {
  default = "EKS NODE TYPES"
}

variable "ami_type" {
  description = "AMI type"
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