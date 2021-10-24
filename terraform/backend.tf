terraform {
  backend "s3" {
    bucket = "webapp-dev-terraform-bucket"
    key    = "terraform.state"
    region = "us-east-1"
  }
}