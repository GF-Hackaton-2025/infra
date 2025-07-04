resource "aws_eks_cluster" "gf-hack-eks" {
  name     = "gf-hack-eks-cluster"
  role_arn = var.labRole

  vpc_config {
    subnet_ids         = ["${var.subnetA}", "${var.subnetB}", "${var.subnetC}"]
    security_group_ids = ["${var.securityGroupId}"]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.gf-hack-eks.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = ["${var.subnetA}", "${var.subnetB}", "${var.subnetC}"]
  disk_size       = 50

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}

resource "aws_eks_access_policy_association" "access" {
  cluster_name  = aws_eks_cluster.gf-hack-eks.name
  policy_arn    = var.policyArn
  principal_arn = var.principalArn

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "access" {
  cluster_name      = aws_eks_cluster.gf-hack-eks.name
  principal_arn     = var.principalArn
  kubernetes_groups = ["gf-hack", "pos-tech"]
  type              = "STANDARD"
}