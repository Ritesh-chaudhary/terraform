variable "vpc_name" {
  default     = "test"
  description = "name of the vpc"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "cidr block of vpc"
}

variable "pub_sub_cidr" {
  default     = "10.0.0.0/24"
  description = "cidr block of vpc"
}

variable "private_sub_cidr" {
  default     = "10.0.1.0/24"
  description = "cidr block of vpc"
}
