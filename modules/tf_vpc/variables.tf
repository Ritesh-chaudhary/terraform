variable "name" {
  default     = "test"
  description = "name of the vpc"
}

variable "cidr" {
  default     = "10.0.0.0/16"
  description = "cidr block of the vpc"
}

variable "enable_dns_hostnames" {
  default     = "True"
  description = "whether to enable dns hostname"
}

variable "enable_dns_support" {
  default     = "True"
  description = "whether to enable dns support"
}
