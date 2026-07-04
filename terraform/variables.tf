variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region for provisioning resources"
}

variable "ami_id" {
  type        = string
  default     = "ami-0e2c8caa4b6378d8c" # Ubuntu 24.04 LTS
  description = "AMI ID for the Kubernetes master and worker nodes"
}


variable "master_instance_type" {
  type        = string
  default     = "t3.medium"
  description = "Instance type for the Kubernetes master node"
}

variable "worker_instance_type" {
  type        = string
  default     = "t3.medium"
  description = "Instance type for the Kubernetes worker nodes"
}

variable "worker_count" {
  type        = number
  default     = 2
  description = "Number of Kubernetes worker nodes to provision"
}
