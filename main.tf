provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA2LE52YC2HWS7WS4I"
  secret_key = "scZIT88J0ezCpYA8sqMbJdxfZqpOCmf8UrgI3zP3"
}

resource "aws_security_group" "instance" {
name = "terraform-example-instance"
description = var.sg_desc
ingress {
from_port = var.server_port
to_port = var.server_port
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "example" {
ami = "ami-0747bdcabd34c712a"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.instance.id]
user_data = <<-EOF
#!/bin/bash
echo "Hello, World" > index.html
nohup busybox httpd -f -p var.server_port &
EOF
tags = {
Name = "terraform-example"
}
}

output "public_ip" {
value = aws_instance.example.public_ip
description = "The public IP address of the web server"
}

output "instance_id" {
value = aws_instance.example.id
description = "This is instance id"
}
