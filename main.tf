resource "aws_instance" "my_app" {
  count = 1
  ami                    = "ami-2757f631"
  instance_type          = "t2.nano"
  subnet_id              = "subnet-0ebb1058ad727cfdb"
  vpc_security_group_ids = ["sg-0880cfdc546b123ba"]
  key_name               = "ryan"
    tags = {
    Name = "${var.tags}"
  }
}

output "instance_public_ips" {
  value = "${aws_instance.my_app.*.id}"
}
