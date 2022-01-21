# Input VAriables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS resources are to be created"
  type        = string
  default     = "us-east-1"
}
# Environment variable
variable "proj_name" {
  description = "Project Name"
  type = string
  default = "Portfolio_Praful"
}

variable "owner" {
  description = "Owner of the Project"
  type = string
  default = "Praful Patel"
}