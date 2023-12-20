
output "Server-PublicIP" {
  value = ["${aws_instance.server.public_ip}"]
}
output "Server-PrivateIP" {
  value = ["${aws_instance.server.private_ip}"]
}

