resource "aws_security_group" "expense" {
  name        = "${var.sg_name}_${terraform.workspace}"
  description = "Allow ssh port on all ip addresses for ${terraform.workspace}"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    local.common_tags, { Name = "${var.sg_name}-${terraform.workspace}" }
  )
}