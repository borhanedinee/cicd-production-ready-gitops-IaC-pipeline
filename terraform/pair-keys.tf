# 1. Generate an RSA private/public key pair
resource "tls_private_key" "k8s_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Register the public key with AWS
resource "aws_key_pair" "k8s-key" {
  key_name   = "k8s-key"
  public_key = tls_private_key.k8s_ssh_key.public_key_openssh
}

# 3. Save the private key to a secrets/ folder in the project root
resource "local_file" "private_key" {
  content         = tls_private_key.k8s_ssh_key.private_key_pem
  filename        = "${path.module}/../secrets/k8s-key.pem"
  file_permission = "0600"
}

