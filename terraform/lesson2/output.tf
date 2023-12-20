
output "server_privata_ipe" {
  description = "Private IP"
  value       = aws_instance.app_server.private_ip
}


output "server_public_ip" {
  description = "Public IP"
  value       = aws_instance.app_server.public_ip
}
