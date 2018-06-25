output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_route_table_id" {
  value = "${aws_vpc.vpc.main_route_table_id}"
}

output "dns_support" {
  value = "${aws_vpc.vpc.enable_dns_support}"
}

output "name" {
  value = "${aws_vpc.vpc.tags.Name}"
}
