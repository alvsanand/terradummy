terraform {
  required_version = "~> 0.11.13"

  required_providers {
    aws = ">= 2.23.0"
  }
}

# Look for an the "latest" AMI that:
# - owner-alias == amazon
# - virtualization-type == hvm
# - owners == hvm

data "aws_ami" "amazon_linux_ami" {
  # TODO
}

# Create an aws instance that
# - use the previous ami id
# - instance_type == t2.micro
# - tag Name == DummyMachine
resource "aws_instance" "web" {
  # TODO
}
