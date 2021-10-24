resource "aws_eks_cluster" "eks" {
  name     = "${local.prefix_name}-cluster"
  role_arn = aws_iam_role.devops_prueba.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids = aws_subnet.public[*].id
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEC2FullAccess,
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryFullAccess,
    aws_iam_role_policy_attachment.AdministratorAccess,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryPowerUser,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.NetworkAdministrator,
    aws_iam_role_policy_attachment.AWSCloudFormationFullAccess
  ]
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "MainNodeGroup"
  node_role_arn   = aws_iam_role.devops_prueba_node_instance_role.arn
  subnet_ids      = aws_subnet.public[*].id

  instance_types = ["t3.medium", "t3.large"]

  remote_access {
    ec2_ssh_key = "useast1-devops"
  }

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 2
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ElasticLoadBalancingFullAccess,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.DEVOPS_ClusterAutoScaler_PRUEBA
  ]
}

data "tls_certificate" "oidc_data" {
  url = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.oidc_data.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}
