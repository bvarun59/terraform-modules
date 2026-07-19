resource "aws_eks_node_group" "managed" {

  for_each = var.node_groups

  cluster_name    = aws_eks_cluster.eks.name
  node_role_arn   = aws_iam_role.node.arn

  node_group_name = "${var.cluster_name}-${each.key}"

  subnet_ids = var.subnet_ids

  instance_types = each.value.instance_types

  ami_type = each.value.ami_type

  disk_size = each.value.disk_size

  capacity_type = each.value.capacity_type

  scaling_config {

    desired_size = each.value.desired_size

    min_size = each.value.min_size

    max_size = each.value.max_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = each.value.labels

  dynamic "taint" {
    for_each = each.value.taints

    content {
      key    = taint.value.key
      value  = taint.value.value
      effect = taint.value.effect
    }
  }

  tags = {
    Name = "${var.cluster_name}-${each.key}"
  }
}