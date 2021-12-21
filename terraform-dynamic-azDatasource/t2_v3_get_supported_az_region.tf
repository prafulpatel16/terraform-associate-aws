#Datasource 1

# Avaialbility zone data sources
data "aws_availability_zones" "praful_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# Datasource 2
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type_offerings
data "aws_ec2_instance_type_offerings" "ec2-filters2" {
  for_each = toset(data.aws_availability_zones.praful_azones.names)
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

#Output
output "output_t2_v3" {
    value = keys({
      for az, details in data.aws_ec2_instance_type_offerings.ec2-filters2: 
      az => details.instance_types if length(details.instance_types) != 0})
     }
    
#Output
output "output_t2_v4" {
    value = keys({
      for az, details in data.aws_ec2_instance_type_offerings.ec2-filters2: 
      az => details.instance_types if length(details.instance_types) != 0})[0]
     }



