variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}


variable "oidc_provider_arn" {
  description = "OIDC Provider ARN"
  type        = string
}

variable "oidc_provider_url" {
  description = "OIDC Provider URL"
  type        = string
}

variable "region" {
  type = string
}