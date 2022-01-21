resource "aws_instance" "web" {
  ami           = "ami-04902260ca3d33422"
  instance_type = "t3.micro"

  tags = {
    Name = "Project1-Portfolio_Praful"
  }
}

resource "aws_vpc" "praful_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "Project1-Portfolio_Praful"
  }
}

resource "aws_ebs_volume" "praful_ebs" {
  availability_zone = "us-east-1a"
  size              = 20

  tags = {
    Name = "Project1-Portfolio_Praful"
  }
}