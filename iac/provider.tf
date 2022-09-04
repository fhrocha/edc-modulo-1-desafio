provider "aws" {
  region = var.aws_region
}

# Center state control file terraform
terraform {
  backend "s3" {
    bucket = "terraform-edc-producao-422471183879"
    key    = "state/edc/producao/terraform.tfstate"
    region = "us-east-1"
  }
}
