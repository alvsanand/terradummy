provider "aws" {
  region  = "eu-west-1"
  profile = "default"

  assume_role {
    role_arn = "arn:aws:iam::527582682406:role/pro-pruebaspr-delegated-devops"
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
