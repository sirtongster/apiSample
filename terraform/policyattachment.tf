resource "aws_iam_role_policy_attachment" "AmazonEC2FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryPowerUser" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "NetworkAdministrator" {
  policy_arn = "arn:aws:iam::aws:policy/job-function/NetworkAdministrator"
  role       = aws_iam_role.devops_prueba.name
}

resource "aws_iam_role_policy_attachment" "AWSCloudFormationFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
  role       = aws_iam_role.devops_prueba.name
}

#

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.devops_prueba_node_instance_role.name
}

resource "aws_iam_role_policy_attachment" "ElasticLoadBalancingFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
  role       = aws_iam_role.devops_prueba_node_instance_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.devops_prueba_node_instance_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.devops_prueba_node_instance_role.name
}

resource "aws_iam_role_policy_attachment" "DEVOPS_ClusterAutoScaler_PRUEBA" {
  policy_arn = aws_iam_policy.DEVOPS_ClusterAutoScaler_PRUEBA.arn
  role       = aws_iam_role.devops_prueba_node_instance_role.name
}

resource "aws_iam_role_policy_attachment" "AWSLoadBalancerControllerAdditionalIAMPolicy" {
  policy_arn = aws_iam_policy.AWSLoadBalancerControllerAdditionalIAMPolicy.arn
  role       = aws_iam_role.load_balancer_controller_role.name
}