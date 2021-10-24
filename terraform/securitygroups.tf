resource "aws_security_group" "allow_eks" {
  name        = "${local.prefix_name}-allow-eks"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.prefix_name}-sg"
  }
}