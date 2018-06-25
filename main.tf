# Configure the AWS Provider
provider "aws" {}

module "vpc" {
  source               = "./modules/tf_vpc"
  name                 = "tf_vpc"
  cidr                 = "172.16.0.0/16"
  enable_dns_hostnames = "False"
  enable_dns_support   = "True"
}

module "pub_sub" {
  source                  = "./modules/tf_subnet"
  name                    = "pub_sub1a"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "172.16.1.0/24"
  az                      = "ap-south-1a"
  map_public_ip_on_launch = "False"
}
