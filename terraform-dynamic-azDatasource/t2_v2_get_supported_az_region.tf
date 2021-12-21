#Datasource
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type_offerings
data "aws_ec2_instance_type_offerings" "ec2-filters1" {
  for_each = toset(["us-east-1a", "us-east-1b", "us-east-1e"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = [each.key]
  }

  location_type = "availability-zone"
}

# Output
output "output_t2_v1_test" {
    value = toset([for t in data.aws_ec2_instance_type_offerings.ec2-filters1: t.instance_types])
  
}


# ouput with map

output "output_t2_v2" {
    value = {
      for az, details in data.aws_ec2_instance_type_offerings.ec2-filters1: az => details.instance_types
    }
}
