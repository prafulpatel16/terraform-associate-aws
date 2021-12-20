# Output values


#Output ForLoop-map
output "For_Ouput_map" {
  description = "For Loop with map"
  value       = [for instance in aws_instance.Web-Server : instance.public_ip]
}
output "For_Output_map_DNS" {
  description = "For llop with map"
  value       = [for instance in aws_instance.Web-Server : instance.public_dns]

}
#Output ForLoop with map
output "For_Output_map_DNS1" {
  description = "For llop with map"
  value       = {for instance in aws_instance.Web-Server : instance.id => instance.public_dns}

}

#Output ForLoop with map advanced
output "For_Output_map_DNS2" {
  description = "For llop with map"
  value       = {for c, instance in aws_instance.Web-Server : c => instance.public_dns}

}
#Output latest Generalized Splat Operator - Returns the list
output "For_Output_splat_operator" {
  description = "latest generalized splat operator"
  value       = aws_instance.Web-Server[*].public_dns

}