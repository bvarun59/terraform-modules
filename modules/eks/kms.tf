resource "aws_kms_key" "eks" {
  count = var.create_kms_key ? 1 : 0

  description = "KMS key used to encrypt Kubernetes Secrets for ${var.cluster_name}"
  deletion_window_in_days = 30
  enable_key_rotation     = true

tags = {
  Name        = "${var.cluster_name}-kms"
  Environment = var.environment
  ManagedBy   = "Terraform"
}
}

resource "aws_kms_alias" "eks" {
  count = var.create_kms_key ? 1 : 0

  name          = "alias/${var.cluster_name}"
  target_key_id = aws_kms_key.eks[0].key_id
}

locals {
  kms_key_arn = var.create_kms_key ? aws_kms_key.eks[0].arn : var.kms_key_arn
}