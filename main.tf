# Configure the AWS Provider
provider "aws" {}

resource "aws_vpc" "test_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = false

  tags {
    Name = "${var.vpc_name}"
  }
}
