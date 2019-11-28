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

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.amazon_linux_ami.id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "DummyMachine"
  }
}

# Call to the module dynamodb with the following parameters:
# - source == modules/dynamodb
# - table_name == DummyTable
module "dynamodb" {
  source = "modules/dynamodb"

  table_name = "DummyTable"
}
