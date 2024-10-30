data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.example
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}


output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

