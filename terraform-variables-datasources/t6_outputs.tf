# Output values

# EC2 Public IP
output "instance_publicip" {
  description = "EC2 instance public ip"
  value       = aws_instance.Web-Server.public_ip
}


# EC2 Public DNS
output "Instance_publicDNS" {
  description = "EC2 instance public DNS"
  value       = aws_instance.Web-Server.public_dns
}