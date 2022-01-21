# Input VAriables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS resources are to be created"
  type        = string
  default     = "us-east-1"
}
# Environment variable
variable "environment" {
  description = "Environment variable used a prefix"
  type = string
  default = "dev"
}

variable "business-division" {
  description = "Business division of infrastrcuture"
  type = string
  default = "SAP"
}