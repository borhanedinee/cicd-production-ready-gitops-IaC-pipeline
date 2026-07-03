resource "aws_instance" "k8s_master" {
  ami                    = var.ami_id
  instance_type          = var.master_instance_type
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  key_name               = aws_key_pair.k8s-key.key_name

  # Tags for Ansible Dynamic Inventory mapping
  tags = {
    Name = "k8s-master"
    Role = "master"
    Env  = "dev"
  }
}

resource "aws_instance" "k8s_worker" {
  count                  = var.worker_count
  ami                    = var.ami_id
  instance_type          = var.worker_instance_type
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  key_name               = aws_key_pair.k8s-key.key_name

  # Tags for Ansible Dynamic Inventory mapping
  tags = {
    # Dynamically names them: k8s-worker-0, k8s-worker-1
    Name = "k8s-worker-${count.index}"
    Role = "worker"
    Env  = "dev"
  }
}
