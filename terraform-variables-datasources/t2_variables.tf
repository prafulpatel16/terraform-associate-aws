# Variables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS resources are to be created"
  type = string
  default = "us-east-1"
}

# AWS Instance Type
variable "instance_type" {
  description = "EC2 instance Type"
  type = string
  default = "t2.micro"
  
  }


# AWS EC2 instanc key pair
variable "instance_keypair" {
    description = "AWS EC2 key pair that needs to be associated with ec2"
    type = string
    default = "terraform-key"
    
  }

  