# Output values


#Output ForLoop-List
output "For_Ouput_List" {
  description = "For Loop with list"
  value       = [for instance in aws_instance.Web-Server : instance.public_ip]
}
output "For_Output_List_DNS" {
  description = "For llop with list"
  value       = [for instance in aws_instance.Web-Server : instance.public_dns]

}