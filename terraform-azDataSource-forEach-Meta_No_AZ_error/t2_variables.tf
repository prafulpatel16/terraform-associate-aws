# Variables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS resources are to be created"
  type        = string
  default     = "us-east-1"
}

# AWS Instance Type - map
variable "instance_type_map" {
  description = "EC2 Instnace Type"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}


# AWS EC2 instanc key pair
variable "instance_keypair" {
  description = "AWS EC2 key pair that needs to be associated with ec2"
  type        = string
  default     = "terraform-key"

}

