provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "bastion_server" {
  ami    = ""
  instance_type = "t2.micro"
}
