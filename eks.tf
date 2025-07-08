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

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.gf-hack-eks.name
}

provider "kubernetes" {
  host                   = aws_eks_cluster.gf-hack-eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.gf-hack-eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.gf-hack-eks.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.gf-hack-eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.gf-hack-eks.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = ["${var.subnetA}", "${var.subnetB}", "${var.subnetC}"]
  disk_size       = 50

  instance_types  = ["t3.medium"]

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