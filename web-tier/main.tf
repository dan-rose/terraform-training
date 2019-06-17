/*

*/
resource "random_id" "names" {
  byte_length = 8
}
resource "aws_instance" "web-tier" {
  count         = "${var.instance_count}"
  ami           = "${var.webtier-amiID}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"

  vpc_security_group_ids = [
    "${aws_security_group.web-tier-sg.id}",
  ]

  tags = "${var.tags}"
}

resource "aws_security_group" "web-tier-sg" {
  name        = "web-tier-security-group-${random_id.names.hex}"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-tier-sg"
  }
}

resource "aws_security_group" "app-tier-sg" {
  name        = "app-tier-security-group-${random_id.names.hex}"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${var.vpc_id}"

  tags = {
    Name = "app-tier-sg"
  }
}
