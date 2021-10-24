# terraform {
#   backend "s3" {
#     bucket = "terraform-state"
#     region = "us-east-1"
#   }
# }

provider "aws" {
  region = var.region
}