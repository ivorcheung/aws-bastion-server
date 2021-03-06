# Create a new instance of the latest Ubuntu 18.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

#This data block fetches the latest Ubuntu ami and passes it into the Instance resource
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion-a" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "Bastion A"
  }
}

resource "aws_instance" "bastion-b" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "Bastion B"
  }
}
