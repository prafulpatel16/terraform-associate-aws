resource "aws_instance" "prp_ec2" {
  ami           = "ami-0ed9277fb7eb570c9" 
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "aws-key"
  user_data = file("${path.module}/user-data-apache.sh")
  tags = {
    "Name" = "prp_Ec2"
  }

}