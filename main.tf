provider "aws" {
  region  = "eu-west-1"
  profile = "default"

  assume_role {
    role_arn = "arn:aws:iam::527582682406:role/pro-pruebaspr-delegated-devops"
  }
}

# Look for the AMI to inject to aws_instance
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

# Use the previous AMI and launch an EC2 instance
resource "aws_instance" "web" {
  ami           = "${data.aws_ami.amazon_linux_ami.id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "DummyMachine"
  }
}

module "elk_service" {
  source = "modules/elasticsearch"
}
