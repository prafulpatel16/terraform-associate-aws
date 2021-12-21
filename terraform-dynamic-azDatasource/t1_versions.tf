#Terraform Block
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

# Provider block
provider "aws" {
  region = "us-east-1"

}
