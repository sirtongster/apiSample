resource "aws_subnet" "public" {
  count = length(var.subnet_cidrs)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                                 = "${local.prefix_name}-sn${count.index + 1}"
    "kubernetes.io/cluster/${local.prefix_name}-cluster" = "shared"
    "kubernetes.io/role/elb"                             = "1"
  }
}