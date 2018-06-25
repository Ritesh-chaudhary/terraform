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

resource "aws_internet_gateway" "igw1" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  tags {
    Name = "igw1"
  }
}

resource "aws_route_table" "rtb1" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw1.id}"
  }

  tags {
    Name = "rtb1"
  }
}

resource "aws_subnet" "public-sub1" {
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "${var.pub_sub_cidr}"

  tags {
    Name = "public-sub1"
  }
}

resource "aws_route_table_association" "pubassoc" {
  subnet_id      = "${aws_subnet.public-sub1.id}"
  route_table_id = "${aws_route_table.rtb1.id}"
}


resource "aws_eip" "nat_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.public-sub1.id}"
}


resource "aws_subnet" "private-sub1" {
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "${var.private_sub_cidr}"

  tags {
    Name = "private1-sub1"
  }
}

resource "aws_route_table" "rtb_pvt1" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }

  tags {
    Name = "rtb-priv"
  }
}

resource "aws_route_table_association" "pvtassoc" {
  subnet_id      = "${aws_subnet.private-sub1.id}"
  route_table_id = "${aws_route_table.rtb_pvt1.id}"
}