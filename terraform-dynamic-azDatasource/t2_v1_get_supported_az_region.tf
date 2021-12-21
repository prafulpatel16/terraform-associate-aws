#Datasource
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type_offerings
data "aws_ec2_instance_type_offerings" "ec2-filters" {
  filter {
    name   = "instance-type"
    values = ["t2.micro", "t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

# Output
output "output_t2_v1" {
    value = data.aws_ec2_instance_type_offerings.ec2-filters.instance_types
  
}