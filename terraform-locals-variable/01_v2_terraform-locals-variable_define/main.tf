locals {
   project1_us = {
    owner     = "Praful Patel"
    proj_name = "Project1_Portfolio_Praful"
  }
}
locals {
   project2_uk = {
    owner     = "Praful Patel"
    proj_name = "Project2_Portfolio_Praful"
  }
}


resource "aws_instance" "web_us" {
  ami           = "ami-04902260ca3d33422"
  instance_type = "t3.micro"
  tags          = local.project1_us
  
}

resource "aws_vpc" "praful_vpc_us" {
  cidr_block = "172.16.0.0/16"
  tags       = local.project1_us

}

resource "aws_ebs_volume" "praful_ebs_us" {
  availability_zone = "us-east-1a"
  size              = 20
  tags              = local.project1_us

}
resource "aws_instance" "web_uk" {
  ami           = "ami-04902260ca3d33422"
  instance_type = "t3.micro"
  tags          = local.project2_uk

}

resource "aws_vpc" "praful_vpc_uk" {
  cidr_block = "172.16.0.0/16"
  tags       = local.project2_uk

}

resource "aws_ebs_volume" "praful_ebs_uk" {
  availability_zone = "us-east-1a"
  size              = 20
  tags              = local.project2_uk

}