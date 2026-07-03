output "instance_public_ip" {
  value       = aws_instance.k8s_master.public_ip
  description = "The public IP of the Kubernetes master node"
}

output "borhan" {
  value       = "hey ${aws_instance.k8s_master.private_ip}"
  description = "This is borhan"
}

output "worker_public_ips" {
  value       = [for instance in aws_instance.k8s_worker : instance.public_ip]
  description = "The public IPs of the Kubernetes worker nodes"
}
