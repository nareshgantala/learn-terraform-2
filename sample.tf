data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.example.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}


output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

resource "aws_route53_record" "www" {
  depends_on = [ aws_instance.web ]
  zone_id = "Z08473532Y02UUGEADBBG"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.private_ip]
}