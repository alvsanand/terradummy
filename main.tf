terraform {
  required_version = "~> 0.11.13"

  required_providers {
    aws = ">= 2.23.0"
  }
}

data "aws_ami" "amazon_linux_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

# Modify resource in order to use variables:
# - instance_type uses variable instance_type
# - Tag name uses variable instance_name
resource "aws_instance" "web" {
  ami           = "" # TODO
  instance_type = "${var.instance_type}"

  tags = {
    Name = "" # TODO
  }
}
