# Output values


#Output public ip with ToSet
output "For_Ouput_map" {
  description = "For Loop with toset "
  value       = toset([for instance in aws_instance.Web-Server : instance.public_ip])
}
output "For_Output_map_DNS" {
  description = "For llop with map"
  value       = toset([for instance in aws_instance.Web-Server : instance.public_dns])

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
