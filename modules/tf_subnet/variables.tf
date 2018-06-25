variable "cidr" {
  default     = "10.0.0.0/24"
  description = "cidr block of subnet"
}

variable "az" {
  default     = "ap-south-1a"
  description = "default cidr block"
}

variable "vpc_id" {
  description = "vpc id"
}
