variable "corp_name" {
  type    = string
  default = "gyf"
}

variable "project_name" {
  type    = string
  default = "uala-test"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "eks_version" {
  type    = string
  default = "1.21"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "172.24.0.0/16"
}

variable "subnet_cidrs" {
  type = list(string)
  default = [
    "172.24.0.0/20",
    "172.24.16.0/20",
    "172.24.32.0/20",
    "172.24.48.0/20",
    "172.24.64.0/20",
  ]
}

variable "availability_zones" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1f"
  ]
}