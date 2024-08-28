variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "my-cluster"
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "instance_type" {
  default = "t3.medium"
}
