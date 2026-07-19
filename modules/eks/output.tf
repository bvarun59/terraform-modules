output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.eks.name
}

output "cluster_token" {
  value = data.aws_eks_cluster_auth.this.token
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.oidc.arn
}

output "oidc_provider_url" {
  value = aws_iam_openid_connect_provider.oidc.url
}

output "kms_key_arn" {
  description = "KMS Key ARN used for EKS Secrets encryption"
  value       = local.kms_key_arn
}

output "kms_key_id" {
  description = "KMS Key ID"
  value       = var.create_kms_key ? aws_kms_key.eks[0].key_id : null
}
