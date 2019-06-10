output "web-tier-sg_name" {
  value = "${aws_security_group.web-tier-sg.name}"
}

output "web-tier-sg_id" {
  value = "${aws_security_group.web-tier-sg.id}"
}
