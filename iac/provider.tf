provider "aws" {
  region = var.aws_region
}

# Center state control file terraform
terraform {
  backend "s3"{
    bucket = "terraform-state-422471183879"
    key = "state/igti-edc/modulo1/desafio/terraform.tfstate"
    region = "us-east-1"
  }
}
