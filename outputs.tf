output "vm_server_ip" {
  value = aws_eip.vm_static_ip.public_ip
}
