locals {
  prefix_name = "${var.corp_name}-${var.project_name}-${var.env}"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${local.prefix_name}-vpc"
  }
}