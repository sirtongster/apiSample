terraform {
  backend "s3" {
    bucket = "${local.prefix_name}-terraform-bucket"
    key = "terraform.state"
    region = var.region
  }
}