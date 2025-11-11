variable "region" {
  description = "AWS region to deploy the lab"
  type        = string
  default     = "eu-west-2"  # London
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "lab-eks"
}

variable "node_type" {
  description = "EC2 instance type for the node group"
  type        = string
  default     = "t3.micro"
}

variable "node_count" {
  description = "Number of nodes in the node group"
  type        = number
  default     = 1
}
