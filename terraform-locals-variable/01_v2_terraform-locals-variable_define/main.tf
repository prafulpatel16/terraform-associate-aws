locals {
   common_tag = {
    owner     = "Praful Patel"
    proj_name = "Project1_Portfolio_Praful"
  }
}
resource "aws_instance" "web" {
  ami           = "ami-04902260ca3d33422"
  instance_type = "t3.micro"
  tags          = local.common_tag

}

resource "aws_vpc" "praful_vpc" {
  cidr_block = "172.16.0.0/16"
  tags       = local.common_tag

}

resource "aws_ebs_volume" "praful_ebs" {
  availability_zone = "us-east-1a"
  size              = 20
  tags              = local.common_tag

}