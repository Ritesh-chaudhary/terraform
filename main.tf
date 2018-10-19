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

module "pri_sub" {
  source                  = "./modules/tf_subnet"
  name                    = "pri_sub1a"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "172.16.2.0/24"
  az                      = "ap-south-1a"
  map_public_ip_on_launch = "False"
}

module "rt" {
  source                  = "./modules/tf_rt_subnet"
  subnet_id               = "${module.pub_sub.subnet_id}"
  route_id                = "${module.vpc.public_route_table_id}"
}

module "nat_eip" {
  source                  = "./modules/tf_eip"
}

module "aws_nat" {
  source 		  = "./modules/tf_nat"
  allocation_id           = "${module.nat_eip.eip_id}"
  subnet_id		  = "${module.pub_sub.subnet_id}"
}
