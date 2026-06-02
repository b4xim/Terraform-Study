variable "aws_region" {
    description = "The AWS region to deploy resources in."
    type        = string
    default     = "us-east-1"
}
variable "ami_id" {
    description = "The AMI ID to use for the EC2 instance."
    type        = string
    default     = "ami-091138d0f0d41ff90"
}
variable "instance_type" {
    description = "The type of EC2 instance to create."
    type        = string
    default     = "t3.small"
}
variable "vpc_id" {
    description = "The VPC to deploy resources in."
    type        = string
    default     = "vpc-00d8f9b1ae284ea34"
}
variable "my_ip" {
  description = "Your public IP address to allow access to the EC2 instance."
  type        = string
  default     = "49.37.226.172"
}