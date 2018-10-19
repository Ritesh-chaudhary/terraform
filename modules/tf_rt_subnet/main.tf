resource "aws_route_table_association" "rt_sub" {
  subnet_id      = "${var.subnet_id}"
  route_table_id = "${var.route_id}"
}
